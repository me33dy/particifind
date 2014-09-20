
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

postsApp.factory('Post', ['$resource', function($resource) {
	return $resource('/api/posts/:id', 
		{id: '@id'},
		{update: {method: "PATCH"}}
		);
}]);

postsApp.controller('postsController', ['$scope', 'Post', function($scope, Post) {
	$scope.test = "hello";

	$scope.posts = [];
	Post.query(function(posts) {
		$scope.posts = posts;
	});




}]);