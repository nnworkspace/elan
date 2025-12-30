module.exports = {
    extends: ['@commitlint/config-conventional'],
    rules: {
        // Traceability: References must not be empty
        'references-empty': [2, 'never'],
        // Traceability: References must use strict 'Refs: #ID' or 'Closes: #ID' format if possible (commitlint native check is loose, we enforce presence)

        // Type Enumeration (Governance)
        'type-enum': [
            2,
            'always',
            [
                'feat',
                'fix',
                'docs',
                'style',
                'refactor',
                'perf',
                'test',
                'build',
                'ci',
                'chore',
                'revert',
            ],
        ],
        // Readability: Allow longer body lines (default is 100)
        'body-max-line-length': [2, 'always', 255],
    },
    parserPreset: {
        parserOpts: {
            issuePrefixes: ['#'],
            referenceActions: ['refs', 'closes', 'Refs', 'Closes', 'ref', 'close'],
        },
    },
};
