
var postsApp = angular.module('postsApp', ['ngResource']);
postsApp.config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);
postsApp.factory('UserPosts', ['$resource', function($resource) {
	return $resource('/api/posts/:id', 
		{id: '@id'},
		{update: {method: "PATCH"}});
}]);

// postsApp.factory('Post', ['$resource', function($resource) {
// 	return $resource('/api/posts/:id', 
// 		{id: '@id'},
// 		{update: {method: "PATCH"}}
// 		);
// }]);

postsApp.controller('postsController', ['$scope', 'UserPosts', function($scope, UserPosts) {
	$scope.posts = [];
	$scope.currentPost = null;

	UserPosts.query(function(posts) {
		$scope.posts = posts;
	});

	$scope.newOrEditPost = function(post) {
		$scope.currentPost = post ? post : {};
	};

	$scope.createPost = function(post) {
		$scope.newPost = new UserPosts(post);
		$scope.newPost.$save(function(resource) {
			$scope.posts.push(resource.post);
		});

	};

	$scope.saveChange = function(post) {
		$scope.createPost(post);
		$scope.currentPost = {};

	};




}]);





// postsApp.controller('postsController', ['$scope', 'Post', function($scope, Post) {
	

// 	$scope.posts = [];
// 	Post.query(function(posts) {
// 		$scope.posts = posts;
// 	});




// }]);