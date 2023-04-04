Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223C6D7080
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 01:21:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjpxl-0004me-4h;
	Tue, 04 Apr 2023 23:21:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pjpxi-0004mT-Ca
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 23:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x6wj5KG3e9APgSLHIh8zSLpDMasG2XSTC0anPWxi6k4=; b=Okd5Udsuopqdcq7JHE47vDjxn7
 XNICOcCYjz4yjMZsGvsy0uQ3hZICT4HQmgg7e5VzcRnZJ0tdmGif/SsDGnimMdITfnybK9kewJtTY
 MaM6EROeZ9U/ln83/6EsbWVqoExvxBd19zCssAhcPhsSrf2k7nHIFtPssjeaXnTiYD0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x6wj5KG3e9APgSLHIh8zSLpDMasG2XSTC0anPWxi6k4=; b=DcUdvAtt7tHOfnHEBhXbmfvxeI
 gdRlrEaUgkB/glpbNh5pAtjMf322JCHF8LI9HUxs53kENMcZ1VRqp9o5vImNTkq86OM7oCm7ZeoL7
 sq6O2vMqhNUSYEHoSJ+OzIBnM6Bytp0TTSaVi7noguQ11TAzqE7TGlb/kmeJPHtBBpo8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjpxg-0001g5-2o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 23:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8114D639CD;
 Tue,  4 Apr 2023 23:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE97C433D2;
 Tue,  4 Apr 2023 23:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680650465;
 bh=e9OzZSZhpjhdK/20RohIslFsS2W370cCjQkOf9bPl/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TelXEldiWt8RwvrKxF5X/jWoGWS1PMSOHBRgKRh55hccegEkp8+w5bqUHprsavpC9
 hd2+ffOsubciLRKijVoD1p3HG3KkC295x8CpGlz1Frz+fv5HfkRXeOaQM7r2eGqCLF
 4HfVdXY0qVGAAYrQ0Lj/ASeT+pkzQBqP1tvi+nAxN0s553dtOnlR8NxBCy4rj5Cs+h
 1JBYrfPwoBQAC4Oi85pOEKA5ma+spnNmgDcZ1FuZHuTGrYCkpfdRGT1Za5aFaBwqAP
 RQgiaYWIm7ivGB/d1+OMhAS3/xt0jF3aWts9B+1DyBzZGsZ4zCSOi/bMDAapee8Ut2
 dd1Nidb66UoCw==
Date: Tue, 4 Apr 2023 16:21:05 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <20230404232105.GA109960@frogsfrogsfrogs>
References: <20230404171411.699655-1-zlang@kernel.org>
 <20230404171411.699655-2-zlang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404171411.699655-2-zlang@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 01:14:07AM +0800, Zorro Lang wrote:
 > As fstests covers more and more fs testing, so we always get help > from
 fs specific mailing list, due to they learn about their features [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1pjpxg-0001g5-2o
Subject: Re: [f2fs-dev] [PATCH 1/5] fstests: add MAINTAINERS and
 get_maintainer.pl files
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: brauner@kernel.org, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ebiggers@google.com, amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, fdmanana@suse.com, ocfs2-devel@oss.oracle.com,
 jack@suse.com, linux-fsdevel@vger.kernel.org, anand.jain@oracle.com,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 01:14:07AM +0800, Zorro Lang wrote:
> As fstests covers more and more fs testing, so we always get help
> from fs specific mailing list, due to they learn about their features
> and bugs more. Besides that, some folks help to review patches
> (relevant with them) more often.
> =

> So I'd like to bring in the similar way of linux/MAINTAINERS, records
> fs relevant mailing lists, reviewers or co-maintainers. To recognize
> the contribution from them, and help more users to know who or what
> mailing list can be added in CC list of a patch.
> =

> The MAINTAINERS and get_maintainer.pl are copied from linux project,
> then made some changes for fstests specially.
> =

> Signed-off-by: Zorro Lang <zlang@kernel.org>
> ---
>  MAINTAINERS             |  116 ++
>  tools/get_maintainer.pl | 2616 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 2732 insertions(+)
>  create mode 100644 MAINTAINERS
>  create mode 100755 tools/get_maintainer.pl
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> new file mode 100644
> index 00000000..09b1a5a3
> --- /dev/null
> +++ b/MAINTAINERS
> @@ -0,0 +1,116 @@
> +List of reviewers, co-maintainers and how to submit fstests changes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Please try to follow the guidelines below.  This will make things
> +easier on the maintainers.  Not all of these guidelines matter for every
> +trivial patch so apply some common sense.
> +
> +Tips for patch submitters
> +-------------------------
> +
> +1.	Always *test* your changes, however small, on at least 4 or
> +	5 people, preferably many more.
> +
> +2.	Make sure your changes compile correctly in multiple
> +	configurations. In particular check that changes work both as a
> +	module and built into the kernel.

Huh?  What kernel? ;)

--D

> +3.	When you are happy with a change make it generally available for
> +	testing and await feedback.
> +
> +4.	Make a patch available to fstests@ list directly, that's the only
> +	one mailing list which maintain the whole fstests project.
> +
> +	PLEASE CC: the relevant reviewers, co-maintainers and mailing lists
> +	that are generated by ``tools/get_maintainer.pl.``
> +
> +	PLEASE try to include any credit lines you want added with the
> +	patch. It avoids people being missed off by mistake and makes
> +	it easier to know who wants adding and who doesn't.
> +
> +	PLEASE document known bugs. If it doesn't work for everything
> +	or does something very odd once a month document it.
> +
> +5.	Make sure you have the right to send any changes you make. If you
> +	do changes at work you may find your employer owns the patch
> +	not you.
> +
> +6.	Happy hacking.
> +
> +Descriptions of section entries and preferred order
> +---------------------------------------------------
> +
> +	M: *Mail* patches to: FullName <address@domain>
> +	   These people might be a co-maintainer (with Supported status) or
> +	   maintainer (with Maintained status).
> +	R: Designated *Reviewer*: FullName <address@domain>
> +	   These reviewers should be CCed on patches.
> +	L: Besides fstests@ list itself, this *Mailing list* is relevant to
> +	   this area, should be CCed.
> +	S: *Status*, one of the following (note: all things are maintained by
> +	   fstests@vger.kernel.org):
> +	   Supported:	Someone is actually paid to look after this.
> +	   Maintained:	Someone actually looks after it, has the privilege to
> +			merge & push.
> +	   Odd Fixes:	It has a maintainer but they don't have time to do
> +			much other than throw the odd patch in. See below..
> +	   Orphan:	No current maintainer [but maybe you could take the
> +			role as you write your new code].
> +	   Obsolete:	Old code. Something tagged obsolete generally means
> +			it has been replaced by a better system and you
> +			should be using that.
> +	W: *Web-page* with status/info
> +	Q: *Patchwork* web based patch tracking system site
> +	B: URI for where to file *bugs*. A web-page with detailed bug
> +	   filing info, a direct bug tracker link, or a mailto: URI.
> +	C: URI for *chat* protocol, server and channel where developers
> +	   usually hang out, for example irc://server/channel.
> +	P: Subsystem Profile document for more details submitting
> +	   patches to the given subsystem. This is either an in-tree file,
> +	   or a URI.
> +	T: *SCM* tree type and location.
> +	   Type is one of: git, hg, quilt, stgit, topgit
> +	F: *Files* and directories wildcard patterns.
> +	   A trailing slash includes all files and subdirectory files.
> +	   F:	tests/xfs/	all files in and below tests/xfs
> +	   F:	tests/generic/*	all files in tests/generic, but not below
> +	   F:	*/ext4/*	all files in "any top level directory"/ext4
> +	   One pattern per line.  Multiple F: lines acceptable.
> +	X: *Excluded* files and directories that are NOT maintained, same
> +	   rules as F:. Files exclusions are tested before file matches.
> +	   Can be useful for excluding a specific subdirectory, for instance:
> +	   F:	src/
> +	   X:	src/vfs
> +	   matches all files in and below net excluding net/ipv6/
> +	N: Files and directories *Regex* patterns.
> +	   N:	[^a-z]tegra	all files whose path contains tegra
> +	                        (not including files like integrator)
> +	   One pattern per line.  Multiple N: lines acceptable.
> +	   tools/get_maintainer.pl has different behavior for files that
> +	   match F: pattern and matches of N: patterns.  By default,
> +	   get_maintainer will not look at git log history when an F: pattern
> +	   match occurs.  When an N: match occurs, git log history is used
> +	   to also notify the people that have git commit signatures.
> +	K: *Content regex* (perl extended) pattern match in a patch or file.
> +	   For instance:
> +	   K: of_get_profile
> +	      matches patches or files that contain "of_get_profile"
> +	   K: \b(printk|pr_(info|err))\b
> +	      matches patches or files that contain one or more of the words
> +	      printk, pr_info or pr_err
> +	   One regex pattern per line.  Multiple K: lines acceptable.
> +
> +Maintainers List
> +----------------
> +
> +.. note:: The whole fstests are maintained by fstests@vger.kernel.org, s=
o you
> +	  should send patch to fstests@ at least. Other relevant mailing list
> +	  or reviewer or co-maintainer can be in cc list.
> +
> +ALL
> +M:	Zorro Lang <zlang@kernel.org>
> +L:	fstests@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> +F:	*
> +F:	*/

Looks ok so far.  I didn't look at the perlscript because my eyes glazed
over and I barely know how to perl anyway. :(

--D

> diff --git a/tools/get_maintainer.pl b/tools/get_maintainer.pl
> new file mode 100755
> index 00000000..376c7c02
> --- /dev/null
> +++ b/tools/get_maintainer.pl
> @@ -0,0 +1,2616 @@
> +#!/usr/bin/env perl
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# This script is copied from linux/scripts/get_maintainer.pl, then
> +# changes for fstests specifically.
> +#
> +# Print selected MAINTAINERS information for
> +# the files modified in a patch or for a file
> +#
> +# usage: perl tools/get_maintainer.pl [OPTIONS] <patch>
> +#        perl tools/get_maintainer.pl [OPTIONS] -f <file>
> +
> +use warnings;
> +use strict;
> +
> +my $P =3D $0;
> +my $V =3D '0.26';
> +
> +use Getopt::Long qw(:config no_auto_abbrev);
> +use Cwd;
> +use File::Find;
> +use File::Spec::Functions;
> +
> +my $cur_path =3D fastgetcwd() . '/';
> +my $lk_path =3D "./";
> +my $email =3D 1;
> +my $email_usename =3D 1;
> +my $email_maintainer =3D 1;
> +my $email_reviewer =3D 1;
> +my $email_fixes =3D 1;
> +my $email_list =3D 1;
> +my $email_moderated_list =3D 1;
> +my $email_subscriber_list =3D 0;
> +my $email_git_penguin_chiefs =3D 0;
> +my $email_git =3D 0;
> +my $email_git_all_signature_types =3D 0;
> +my $email_git_blame =3D 0;
> +my $email_git_blame_signatures =3D 1;
> +my $email_git_fallback =3D 1;
> +my $email_git_min_signatures =3D 1;
> +my $email_git_max_maintainers =3D 5;
> +my $email_git_min_percent =3D 5;
> +my $email_git_since =3D "1-year-ago";
> +my $email_hg_since =3D "-365";
> +my $interactive =3D 0;
> +my $email_remove_duplicates =3D 1;
> +my $email_use_mailmap =3D 1;
> +my $output_multiline =3D 1;
> +my $output_separator =3D ", ";
> +my $output_roles =3D 0;
> +my $output_rolestats =3D 1;
> +my $output_section_maxlen =3D 50;
> +my $scm =3D 0;
> +my $tree =3D 1;
> +my $web =3D 0;
> +my $subsystem =3D 0;
> +my $status =3D 0;
> +my $letters =3D "";
> +my $keywords =3D 1;
> +my $sections =3D 0;
> +my $email_file_emails =3D 0;
> +my $from_filename =3D 0;
> +my $pattern_depth =3D 0;
> +my $self_test =3D undef;
> +my $version =3D 0;
> +my $help =3D 0;
> +my $find_maintainer_files =3D 0;
> +my $maintainer_path;
> +my $vcs_used =3D 0;
> +
> +my $exit =3D 0;
> +
> +my @files =3D ();
> +my @fixes =3D ();			# If a patch description includes Fixes: lines
> +my @range =3D ();
> +my @keyword_tvi =3D ();
> +my @file_emails =3D ();
> +
> +my %commit_author_hash;
> +my %commit_signer_hash;
> +
> +my @penguin_chief =3D ();
> +push(@penguin_chief, "Zorro Lang:zlang\@kernel.org");
> +
> +my @penguin_chief_names =3D ();
> +foreach my $chief (@penguin_chief) {
> +    if ($chief =3D~ m/^(.*):(.*)/) {
> +	my $chief_name =3D $1;
> +	my $chief_addr =3D $2;
> +	push(@penguin_chief_names, $chief_name);
> +    }
> +}
> +my $penguin_chiefs =3D "\(" . join("|", @penguin_chief_names) . "\)";
> +
> +# Signature types of people who are either
> +# 	a) responsible for the code in question, or
> +# 	b) familiar enough with it to give relevant feedback
> +my @signature_tags =3D ();
> +push(@signature_tags, "Signed-off-by:");
> +push(@signature_tags, "Reviewed-by:");
> +push(@signature_tags, "Acked-by:");
> +
> +my $signature_pattern =3D "\(" . join("|", @signature_tags) . "\)";
> +
> +# rfc822 email address - preloaded methods go here.
> +my $rfc822_lwsp =3D "(?:(?:\\r\\n)?[ \\t])";
> +my $rfc822_char =3D '[\\000-\\377]';
> +
> +# VCS command support: class-like functions and strings
> +
> +my %VCS_cmds;
> +
> +my %VCS_cmds_git =3D (
> +    "execute_cmd" =3D> \&git_execute_cmd,
> +    "available" =3D> '(which("git") ne "") && (-e ".git")',
> +    "find_signers_cmd" =3D>
> +	"git log --no-color --follow --since=3D\$email_git_since " .
> +	    '--numstat --no-merges ' .
> +	    '--format=3D"GitCommit: %H%n' .
> +		      'GitAuthor: %an <%ae>%n' .
> +		      'GitDate: %aD%n' .
> +		      'GitSubject: %s%n' .
> +		      '%b%n"' .
> +	    " -- \$file",
> +    "find_commit_signers_cmd" =3D>
> +	"git log --no-color " .
> +	    '--numstat ' .
> +	    '--format=3D"GitCommit: %H%n' .
> +		      'GitAuthor: %an <%ae>%n' .
> +		      'GitDate: %aD%n' .
> +		      'GitSubject: %s%n' .
> +		      '%b%n"' .
> +	    " -1 \$commit",
> +    "find_commit_author_cmd" =3D>
> +	"git log --no-color " .
> +	    '--numstat ' .
> +	    '--format=3D"GitCommit: %H%n' .
> +		      'GitAuthor: %an <%ae>%n' .
> +		      'GitDate: %aD%n' .
> +		      'GitSubject: %s%n"' .
> +	    " -1 \$commit",
> +    "blame_range_cmd" =3D> "git blame -l -L \$diff_start,+\$diff_length =
\$file",
> +    "blame_file_cmd" =3D> "git blame -l \$file",
> +    "commit_pattern" =3D> "^GitCommit: ([0-9a-f]{40,40})",
> +    "blame_commit_pattern" =3D> "^([0-9a-f]+) ",
> +    "author_pattern" =3D> "^GitAuthor: (.*)",
> +    "subject_pattern" =3D> "^GitSubject: (.*)",
> +    "stat_pattern" =3D> "^(\\d+)\\t(\\d+)\\t\$file\$",
> +    "file_exists_cmd" =3D> "git ls-files \$file",
> +    "list_files_cmd" =3D> "git ls-files \$file",
> +);
> +
> +my %VCS_cmds_hg =3D (
> +    "execute_cmd" =3D> \&hg_execute_cmd,
> +    "available" =3D> '(which("hg") ne "") && (-d ".hg")',
> +    "find_signers_cmd" =3D>
> +	"hg log --date=3D\$email_hg_since " .
> +	    "--template=3D'HgCommit: {node}\\n" .
> +	                "HgAuthor: {author}\\n" .
> +			"HgSubject: {desc}\\n'" .
> +	    " -- \$file",
> +    "find_commit_signers_cmd" =3D>
> +	"hg log " .
> +	    "--template=3D'HgSubject: {desc}\\n'" .
> +	    " -r \$commit",
> +    "find_commit_author_cmd" =3D>
> +	"hg log " .
> +	    "--template=3D'HgCommit: {node}\\n" .
> +		        "HgAuthor: {author}\\n" .
> +			"HgSubject: {desc|firstline}\\n'" .
> +	    " -r \$commit",
> +    "blame_range_cmd" =3D> "",		# not supported
> +    "blame_file_cmd" =3D> "hg blame -n \$file",
> +    "commit_pattern" =3D> "^HgCommit: ([0-9a-f]{40,40})",
> +    "blame_commit_pattern" =3D> "^([ 0-9a-f]+):",
> +    "author_pattern" =3D> "^HgAuthor: (.*)",
> +    "subject_pattern" =3D> "^HgSubject: (.*)",
> +    "stat_pattern" =3D> "^(\\d+)\t(\\d+)\t\$file\$",
> +    "file_exists_cmd" =3D> "hg files \$file",
> +    "list_files_cmd" =3D> "hg manifest -R \$file",
> +);
> +
> +my $conf =3D which_conf(".get_maintainer.conf");
> +if (-f $conf) {
> +    my @conf_args;
> +    open(my $conffile, '<', "$conf")
> +	or warn "$P: Can't find a readable .get_maintainer.conf file $!\n";
> +
> +    while (<$conffile>) {
> +	my $line =3D $_;
> +
> +	$line =3D~ s/\s*\n?$//g;
> +	$line =3D~ s/^\s*//g;
> +	$line =3D~ s/\s+/ /g;
> +
> +	next if ($line =3D~ m/^\s*#/);
> +	next if ($line =3D~ m/^\s*$/);
> +
> +	my @words =3D split(" ", $line);
> +	foreach my $word (@words) {
> +	    last if ($word =3D~ m/^#/);
> +	    push (@conf_args, $word);
> +	}
> +    }
> +    close($conffile);
> +    unshift(@ARGV, @conf_args) if @conf_args;
> +}
> +
> +my @ignore_emails =3D ();
> +my $ignore_file =3D which_conf(".get_maintainer.ignore");
> +if (-f $ignore_file) {
> +    open(my $ignore, '<', "$ignore_file")
> +	or warn "$P: Can't find a readable .get_maintainer.ignore file $!\n";
> +    while (<$ignore>) {
> +	my $line =3D $_;
> +
> +	$line =3D~ s/\s*\n?$//;
> +	$line =3D~ s/^\s*//;
> +	$line =3D~ s/\s+$//;
> +	$line =3D~ s/#.*$//;
> +
> +	next if ($line =3D~ m/^\s*$/);
> +	if (rfc822_valid($line)) {
> +	    push(@ignore_emails, $line);
> +	}
> +    }
> +    close($ignore);
> +}
> +
> +if ($#ARGV > 0) {
> +    foreach (@ARGV) {
> +        if ($_ =3D~ /^-{1,2}self-test(?:=3D|$)/) {
> +            die "$P: using --self-test does not allow any other option o=
r argument\n";
> +        }
> +    }
> +}
> +
> +if (!GetOptions(
> +		'email!' =3D> \$email,
> +		'git!' =3D> \$email_git,
> +		'git-all-signature-types!' =3D> \$email_git_all_signature_types,
> +		'git-blame!' =3D> \$email_git_blame,
> +		'git-blame-signatures!' =3D> \$email_git_blame_signatures,
> +		'git-fallback!' =3D> \$email_git_fallback,
> +		'git-chief-penguins!' =3D> \$email_git_penguin_chiefs,
> +		'git-min-signatures=3Di' =3D> \$email_git_min_signatures,
> +		'git-max-maintainers=3Di' =3D> \$email_git_max_maintainers,
> +		'git-min-percent=3Di' =3D> \$email_git_min_percent,
> +		'git-since=3Ds' =3D> \$email_git_since,
> +		'hg-since=3Ds' =3D> \$email_hg_since,
> +		'i|interactive!' =3D> \$interactive,
> +		'remove-duplicates!' =3D> \$email_remove_duplicates,
> +		'mailmap!' =3D> \$email_use_mailmap,
> +		'm!' =3D> \$email_maintainer,
> +		'r!' =3D> \$email_reviewer,
> +		'n!' =3D> \$email_usename,
> +		'l!' =3D> \$email_list,
> +		'fixes!' =3D> \$email_fixes,
> +		'moderated!' =3D> \$email_moderated_list,
> +		's!' =3D> \$email_subscriber_list,
> +		'multiline!' =3D> \$output_multiline,
> +		'roles!' =3D> \$output_roles,
> +		'rolestats!' =3D> \$output_rolestats,
> +		'separator=3Ds' =3D> \$output_separator,
> +		'subsystem!' =3D> \$subsystem,
> +		'status!' =3D> \$status,
> +		'scm!' =3D> \$scm,
> +		'tree!' =3D> \$tree,
> +		'web!' =3D> \$web,
> +		'letters=3Ds' =3D> \$letters,
> +		'pattern-depth=3Di' =3D> \$pattern_depth,
> +		'k|keywords!' =3D> \$keywords,
> +		'sections!' =3D> \$sections,
> +		'fe|file-emails!' =3D> \$email_file_emails,
> +		'f|file' =3D> \$from_filename,
> +		'find-maintainer-files' =3D> \$find_maintainer_files,
> +		'mpath|maintainer-path=3Ds' =3D> \$maintainer_path,
> +		'self-test:s' =3D> \$self_test,
> +		'v|version' =3D> \$version,
> +		'h|help|usage' =3D> \$help,
> +		)) {
> +    die "$P: invalid argument - use --help if necessary\n";
> +}
> +
> +if ($help !=3D 0) {
> +    usage();
> +    exit 0;
> +}
> +
> +if ($version !=3D 0) {
> +    print("${P} ${V}\n");
> +    exit 0;
> +}
> +
> +if (defined $self_test) {
> +    read_all_maintainer_files();
> +    self_test();
> +    exit 0;
> +}
> +
> +if (-t STDIN && !@ARGV) {
> +    # We're talking to a terminal, but have no command line arguments.
> +    die "$P: missing patchfile or -f file - use --help if necessary\n";
> +}
> +
> +$output_multiline =3D 0 if ($output_separator ne ", ");
> +$output_rolestats =3D 1 if ($interactive);
> +$output_roles =3D 1 if ($output_rolestats);
> +
> +if ($sections || $letters ne "") {
> +    $sections =3D 1;
> +    $email =3D 0;
> +    $email_list =3D 0;
> +    $scm =3D 0;
> +    $status =3D 0;
> +    $subsystem =3D 0;
> +    $web =3D 0;
> +    $keywords =3D 0;
> +    $interactive =3D 0;
> +} else {
> +    my $selections =3D $email + $scm + $status + $subsystem + $web;
> +    if ($selections =3D=3D 0) {
> +	die "$P:  Missing required option: email, scm, status, subsystem or web=
\n";
> +    }
> +}
> +
> +if ($email &&
> +    ($email_maintainer + $email_reviewer +
> +     $email_list + $email_subscriber_list +
> +     $email_git + $email_git_penguin_chiefs + $email_git_blame) =3D=3D 0=
) {
> +    die "$P: Please select at least 1 email option\n";
> +}
> +
> +if ($tree && !top_of_fstests_tree($lk_path)) {
> +    die "$P: The current directory does not appear to be "
> +	. "a fstests source tree.\n";
> +}
> +
> +## Read MAINTAINERS for type/value pairs
> +
> +my @typevalue =3D ();
> +my %keyword_hash;
> +my @mfiles =3D ();
> +my @self_test_info =3D ();
> +
> +sub read_maintainer_file {
> +    my ($file) =3D @_;
> +
> +    open (my $maint, '<', "$file")
> +	or die "$P: Can't open MAINTAINERS file '$file': $!\n";
> +    my $i =3D 1;
> +    while (<$maint>) {
> +	my $line =3D $_;
> +	chomp $line;
> +
> +	if ($line =3D~ m/^([A-Z]):\s*(.*)/) {
> +	    my $type =3D $1;
> +	    my $value =3D $2;
> +
> +	    ##Filename pattern matching
> +	    if ($type eq "F" || $type eq "X") {
> +		$value =3D~ s@\.@\\\.@g;       ##Convert . to \.
> +		$value =3D~ s/\*/\.\*/g;       ##Convert * to .*
> +		$value =3D~ s/\?/\./g;         ##Convert ? to .
> +		##if pattern is a directory and it lacks a trailing slash, add one
> +		if ((-d $value)) {
> +		    $value =3D~ s@([^/])$@$1/@;
> +		}
> +	    } elsif ($type eq "K") {
> +		$keyword_hash{@typevalue} =3D $value;
> +	    }
> +	    push(@typevalue, "$type:$value");
> +	} elsif (!(/^\s*$/ || /^\s*\#/)) {
> +	    push(@typevalue, $line);
> +	}
> +	if (defined $self_test) {
> +	    push(@self_test_info, {file=3D>$file, linenr=3D>$i, line=3D>$line});
> +	}
> +	$i++;
> +    }
> +    close($maint);
> +}
> +
> +sub find_is_maintainer_file {
> +    my ($file) =3D $_;
> +    return if ($file !~ m@/MAINTAINERS$@);
> +    $file =3D $File::Find::name;
> +    return if (! -f $file);
> +    push(@mfiles, $file);
> +}
> +
> +sub find_ignore_git {
> +    return grep { $_ !~ /^\.git$/; } @_;
> +}
> +
> +read_all_maintainer_files();
> +
> +sub read_all_maintainer_files {
> +    my $path =3D "${lk_path}MAINTAINERS";
> +    if (defined $maintainer_path) {
> +	$path =3D $maintainer_path;
> +	# Perl Cookbook tilde expansion if necessary
> +	$path =3D~ s@^~([^/]*)@ $1 ? (getpwnam($1))[7] : ( $ENV{HOME} || $ENV{L=
OGDIR} || (getpwuid($<))[7])@ex;
> +    }
> +
> +    if (-d $path) {
> +	$path .=3D '/' if ($path !~ m@/$@);
> +	if ($find_maintainer_files) {
> +	    find( { wanted =3D> \&find_is_maintainer_file,
> +		    preprocess =3D> \&find_ignore_git,
> +		    no_chdir =3D> 1,
> +		}, "$path");
> +	} else {
> +	    opendir(DIR, "$path") or die $!;
> +	    my @files =3D readdir(DIR);
> +	    closedir(DIR);
> +	    foreach my $file (@files) {
> +		push(@mfiles, "$path$file") if ($file !~ /^\./);
> +	    }
> +	}
> +    } elsif (-f "$path") {
> +	push(@mfiles, "$path");
> +    } else {
> +	die "$P: MAINTAINER file not found '$path'\n";
> +    }
> +    die "$P: No MAINTAINER files found in '$path'\n" if (scalar(@mfiles)=
 =3D=3D 0);
> +    foreach my $file (@mfiles) {
> +	read_maintainer_file("$file");
> +    }
> +}
> +
> +sub maintainers_in_file {
> +    my ($file) =3D @_;
> +
> +    return if ($file =3D~ m@\bMAINTAINERS$@);
> +
> +    if (-f $file && ($email_file_emails || $file =3D~ /\.yaml$/)) {
> +	open(my $f, '<', $file)
> +	    or die "$P: Can't open $file: $!\n";
> +	my $text =3D do { local($/) ; <$f> };
> +	close($f);
> +
> +	my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF\"\' \,\.\+-]*\s*[\,]*\s*[=
\(\<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$=
g;
> +	push(@file_emails, clean_file_emails(@poss_addr));
> +    }
> +}
> +
> +#
> +# Read mail address map
> +#
> +
> +my $mailmap;
> +
> +read_mailmap();
> +
> +sub read_mailmap {
> +    $mailmap =3D {
> +	names =3D> {},
> +	addresses =3D> {}
> +    };
> +
> +    return if (!$email_use_mailmap || !(-f "${lk_path}.mailmap"));
> +
> +    open(my $mailmap_file, '<', "${lk_path}.mailmap")
> +	or warn "$P: Can't open .mailmap: $!\n";
> +
> +    while (<$mailmap_file>) {
> +	s/#.*$//; #strip comments
> +	s/^\s+|\s+$//g; #trim
> +
> +	next if (/^\s*$/); #skip empty lines
> +	#entries have one of the following formats:
> +	# name1 <mail1>
> +	# <mail1> <mail2>
> +	# name1 <mail1> <mail2>
> +	# name1 <mail1> name2 <mail2>
> +	# (see man git-shortlog)
> +
> +	if (/^([^<]+)<([^>]+)>$/) {
> +	    my $real_name =3D $1;
> +	    my $address =3D $2;
> +
> +	    $real_name =3D~ s/\s+$//;
> +	    ($real_name, $address) =3D parse_email("$real_name <$address>");
> +	    $mailmap->{names}->{$address} =3D $real_name;
> +
> +	} elsif (/^<([^>]+)>\s*<([^>]+)>$/) {
> +	    my $real_address =3D $1;
> +	    my $wrong_address =3D $2;
> +
> +	    $mailmap->{addresses}->{$wrong_address} =3D $real_address;
> +
> +	} elsif (/^(.+)<([^>]+)>\s*<([^>]+)>$/) {
> +	    my $real_name =3D $1;
> +	    my $real_address =3D $2;
> +	    my $wrong_address =3D $3;
> +
> +	    $real_name =3D~ s/\s+$//;
> +	    ($real_name, $real_address) =3D
> +		parse_email("$real_name <$real_address>");
> +	    $mailmap->{names}->{$wrong_address} =3D $real_name;
> +	    $mailmap->{addresses}->{$wrong_address} =3D $real_address;
> +
> +	} elsif (/^(.+)<([^>]+)>\s*(.+)\s*<([^>]+)>$/) {
> +	    my $real_name =3D $1;
> +	    my $real_address =3D $2;
> +	    my $wrong_name =3D $3;
> +	    my $wrong_address =3D $4;
> +
> +	    $real_name =3D~ s/\s+$//;
> +	    ($real_name, $real_address) =3D
> +		parse_email("$real_name <$real_address>");
> +
> +	    $wrong_name =3D~ s/\s+$//;
> +	    ($wrong_name, $wrong_address) =3D
> +		parse_email("$wrong_name <$wrong_address>");
> +
> +	    my $wrong_email =3D format_email($wrong_name, $wrong_address, 1);
> +	    $mailmap->{names}->{$wrong_email} =3D $real_name;
> +	    $mailmap->{addresses}->{$wrong_email} =3D $real_address;
> +	}
> +    }
> +    close($mailmap_file);
> +}
> +
> +## use the filenames on the command line or find the filenames in the pa=
tchfiles
> +
> +if (!@ARGV) {
> +    push(@ARGV, "&STDIN");
> +}
> +
> +foreach my $file (@ARGV) {
> +    if ($file ne "&STDIN") {
> +	$file =3D canonpath($file);
> +	##if $file is a directory and it lacks a trailing slash, add one
> +	if ((-d $file)) {
> +	    $file =3D~ s@([^/])$@$1/@;
> +	} elsif (!(-f $file)) {
> +	    die "$P: file '${file}' not found\n";
> +	}
> +    }
> +    if ($from_filename && (vcs_exists() && !vcs_file_exists($file))) {
> +	warn "$P: file '$file' not found in version control $!\n";
> +    }
> +    if ($from_filename || ($file ne "&STDIN" && vcs_file_exists($file)))=
 {
> +	$file =3D~ s/^\Q${cur_path}\E//;	#strip any absolute path
> +	$file =3D~ s/^\Q${lk_path}\E//;	#or the path to the lk tree
> +	push(@files, $file);
> +	if ($file ne "MAINTAINERS" && -f $file && $keywords) {
> +	    open(my $f, '<', $file)
> +		or die "$P: Can't open $file: $!\n";
> +	    my $text =3D do { local($/) ; <$f> };
> +	    close($f);
> +	    if ($keywords) {
> +		foreach my $line (keys %keyword_hash) {
> +		    if ($text =3D~ m/$keyword_hash{$line}/x) {
> +			push(@keyword_tvi, $line);
> +		    }
> +		}
> +	    }
> +	}
> +    } else {
> +	my $file_cnt =3D @files;
> +	my $lastfile;
> +
> +	open(my $patch, "< $file")
> +	    or die "$P: Can't open $file: $!\n";
> +
> +	# We can check arbitrary information before the patch
> +	# like the commit message, mail headers, etc...
> +	# This allows us to match arbitrary keywords against any part
> +	# of a git format-patch generated file (subject tags, etc...)
> +
> +	my $patch_prefix =3D "";			#Parsing the intro
> +
> +	while (<$patch>) {
> +	    my $patch_line =3D $_;
> +	    if (m/^ mode change [0-7]+ =3D> [0-7]+ (\S+)\s*$/) {
> +		my $filename =3D $1;
> +		push(@files, $filename);
> +	    } elsif (m/^rename (?:from|to) (\S+)\s*$/) {
> +		my $filename =3D $1;
> +		push(@files, $filename);
> +	    } elsif (m/^diff --git a\/(\S+) b\/(\S+)\s*$/) {
> +		my $filename1 =3D $1;
> +		my $filename2 =3D $2;
> +		push(@files, $filename1);
> +		push(@files, $filename2);
> +	    } elsif (m/^Fixes:\s+([0-9a-fA-F]{6,40})/) {
> +		push(@fixes, $1) if ($email_fixes);
> +	    } elsif (m/^\+\+\+\s+(\S+)/ or m/^---\s+(\S+)/) {
> +		my $filename =3D $1;
> +		$filename =3D~ s@^[^/]*/@@;
> +		$filename =3D~ s@\n@@;
> +		$lastfile =3D $filename;
> +		push(@files, $filename);
> +		$patch_prefix =3D "^[+-].*";	#Now parsing the actual patch
> +	    } elsif (m/^\@\@ -(\d+),(\d+)/) {
> +		if ($email_git_blame) {
> +		    push(@range, "$lastfile:$1:$2");
> +		}
> +	    } elsif ($keywords) {
> +		foreach my $line (keys %keyword_hash) {
> +		    if ($patch_line =3D~ m/${patch_prefix}$keyword_hash{$line}/x) {
> +			push(@keyword_tvi, $line);
> +		    }
> +		}
> +	    }
> +	}
> +	close($patch);
> +
> +	if ($file_cnt =3D=3D @files) {
> +	    warn "$P: file '${file}' doesn't appear to be a patch.  "
> +		. "Add -f to options?\n";
> +	}
> +	@files =3D sort_and_uniq(@files);
> +    }
> +}
> +
> +@file_emails =3D uniq(@file_emails);
> +@fixes =3D uniq(@fixes);
> +
> +my %email_hash_name;
> +my %email_hash_address;
> +my @email_to =3D ();
> +my %hash_list_to;
> +my @list_to =3D ();
> +my @scm =3D ();
> +my @web =3D ();
> +my @subsystem =3D ();
> +my @status =3D ();
> +my %deduplicate_name_hash =3D ();
> +my %deduplicate_address_hash =3D ();
> +
> +my @maintainers =3D get_maintainers();
> +if (@maintainers) {
> +    @maintainers =3D merge_email(@maintainers);
> +    output(@maintainers);
> +}
> +
> +if ($scm) {
> +    @scm =3D uniq(@scm);
> +    output(@scm);
> +}
> +
> +if ($status) {
> +    @status =3D uniq(@status);
> +    output(@status);
> +}
> +
> +if ($subsystem) {
> +    @subsystem =3D uniq(@subsystem);
> +    output(@subsystem);
> +}
> +
> +if ($web) {
> +    @web =3D uniq(@web);
> +    output(@web);
> +}
> +
> +exit($exit);
> +
> +sub self_test {
> +    my @lsfiles =3D ();
> +    my @good_links =3D ();
> +    my @bad_links =3D ();
> +    my @section_headers =3D ();
> +    my $index =3D 0;
> +
> +    @lsfiles =3D vcs_list_files($lk_path);
> +
> +    for my $x (@self_test_info) {
> +	$index++;
> +
> +	## Section header duplication and missing section content
> +	if (($self_test eq "" || $self_test =3D~ /\bsections\b/) &&
> +	    $x->{line} =3D~ /^\S[^:]/ &&
> +	    defined $self_test_info[$index] &&
> +	    $self_test_info[$index]->{line} =3D~ /^([A-Z]):\s*\S/) {
> +	    my $has_S =3D 0;
> +	    my $has_F =3D 0;
> +	    my $has_ML =3D 0;
> +	    my $status =3D "";
> +	    if (grep(m@^\Q$x->{line}\E@, @section_headers)) {
> +		print("$x->{file}:$x->{linenr}: warning: duplicate section header\t$x-=
>{line}\n");
> +	    } else {
> +		push(@section_headers, $x->{line});
> +	    }
> +	    my $nextline =3D $index;
> +	    while (defined $self_test_info[$nextline] &&
> +		   $self_test_info[$nextline]->{line} =3D~ /^([A-Z]):\s*(\S.*)/) {
> +		my $type =3D $1;
> +		my $value =3D $2;
> +		if ($type eq "S") {
> +		    $has_S =3D 1;
> +		    $status =3D $value;
> +		} elsif ($type eq "F" || $type eq "N") {
> +		    $has_F =3D 1;
> +		} elsif ($type eq "M" || $type eq "R" || $type eq "L") {
> +		    $has_ML =3D 1;
> +		}
> +		$nextline++;
> +	    }
> +	    if (!$has_ML && $status !~ /orphan|obsolete/i) {
> +		print("$x->{file}:$x->{linenr}: warning: section without email address=
\t$x->{line}\n");
> +	    }
> +	    if (!$has_S) {
> +		print("$x->{file}:$x->{linenr}: warning: section without status \t$x->=
{line}\n");
> +	    }
> +	    if (!$has_F) {
> +		print("$x->{file}:$x->{linenr}: warning: section without file pattern\=
t$x->{line}\n");
> +	    }
> +	}
> +
> +	next if ($x->{line} !~ /^([A-Z]):\s*(.*)/);
> +
> +	my $type =3D $1;
> +	my $value =3D $2;
> +
> +	## Filename pattern matching
> +	if (($type eq "F" || $type eq "X") &&
> +	    ($self_test eq "" || $self_test =3D~ /\bpatterns\b/)) {
> +	    $value =3D~ s@\.@\\\.@g;       ##Convert . to \.
> +	    $value =3D~ s/\*/\.\*/g;       ##Convert * to .*
> +	    $value =3D~ s/\?/\./g;         ##Convert ? to .
> +	    ##if pattern is a directory and it lacks a trailing slash, add one
> +	    if ((-d $value)) {
> +		$value =3D~ s@([^/])$@$1/@;
> +	    }
> +	    if (!grep(m@^$value@, @lsfiles)) {
> +		print("$x->{file}:$x->{linenr}: warning: no file matches\t$x->{line}\n=
");
> +	    }
> +
> +	## Link reachability
> +	} elsif (($type eq "W" || $type eq "Q" || $type eq "B") &&
> +		 $value =3D~ /^https?:/ &&
> +		 ($self_test eq "" || $self_test =3D~ /\blinks\b/)) {
> +	    next if (grep(m@^\Q$value\E$@, @good_links));
> +	    my $isbad =3D 0;
> +	    if (grep(m@^\Q$value\E$@, @bad_links)) {
> +	        $isbad =3D 1;
> +	    } else {
> +		my $output =3D `wget --spider -q --no-check-certificate --timeout 10 -=
-tries 1 $value`;
> +		if ($? =3D=3D 0) {
> +		    push(@good_links, $value);
> +		} else {
> +		    push(@bad_links, $value);
> +		    $isbad =3D 1;
> +		}
> +	    }
> +	    if ($isbad) {
> +	        print("$x->{file}:$x->{linenr}: warning: possible bad link\t$x-=
>{line}\n");
> +	    }
> +
> +	## SCM reachability
> +	} elsif ($type eq "T" &&
> +		 ($self_test eq "" || $self_test =3D~ /\bscm\b/)) {
> +	    next if (grep(m@^\Q$value\E$@, @good_links));
> +	    my $isbad =3D 0;
> +	    if (grep(m@^\Q$value\E$@, @bad_links)) {
> +	        $isbad =3D 1;
> +            } elsif ($value !~ /^(?:git|quilt|hg)\s+\S/) {
> +		print("$x->{file}:$x->{linenr}: warning: malformed entry\t$x->{line}\n=
");
> +	    } elsif ($value =3D~ /^git\s+(\S+)(\s+([^\(]+\S+))?/) {
> +		my $url =3D $1;
> +		my $branch =3D "";
> +		$branch =3D $3 if $3;
> +		my $output =3D `git ls-remote --exit-code -h "$url" $branch > /dev/nul=
l 2>&1`;
> +		if ($? =3D=3D 0) {
> +		    push(@good_links, $value);
> +		} else {
> +		    push(@bad_links, $value);
> +		    $isbad =3D 1;
> +		}
> +	    } elsif ($value =3D~ /^(?:quilt|hg)\s+(https?:\S+)/) {
> +		my $url =3D $1;
> +		my $output =3D `wget --spider -q --no-check-certificate --timeout 10 -=
-tries 1 $url`;
> +		if ($? =3D=3D 0) {
> +		    push(@good_links, $value);
> +		} else {
> +		    push(@bad_links, $value);
> +		    $isbad =3D 1;
> +		}
> +	    }
> +	    if ($isbad) {
> +		print("$x->{file}:$x->{linenr}: warning: possible bad link\t$x->{line}=
\n");
> +	    }
> +	}
> +    }
> +}
> +
> +sub ignore_email_address {
> +    my ($address) =3D @_;
> +
> +    foreach my $ignore (@ignore_emails) {
> +	return 1 if ($ignore eq $address);
> +    }
> +
> +    return 0;
> +}
> +
> +sub range_is_maintained {
> +    my ($start, $end) =3D @_;
> +
> +    for (my $i =3D $start; $i < $end; $i++) {
> +	my $line =3D $typevalue[$i];
> +	if ($line =3D~ m/^([A-Z]):\s*(.*)/) {
> +	    my $type =3D $1;
> +	    my $value =3D $2;
> +	    if ($type eq 'S') {
> +		if ($value =3D~ /(maintain|support)/i) {
> +		    return 1;
> +		}
> +	    }
> +	}
> +    }
> +    return 0;
> +}
> +
> +sub range_has_maintainer {
> +    my ($start, $end) =3D @_;
> +
> +    for (my $i =3D $start; $i < $end; $i++) {
> +	my $line =3D $typevalue[$i];
> +	if ($line =3D~ m/^([A-Z]):\s*(.*)/) {
> +	    my $type =3D $1;
> +	    my $value =3D $2;
> +	    if ($type eq 'M') {
> +		return 1;
> +	    }
> +	}
> +    }
> +    return 0;
> +}
> +
> +sub get_maintainers {
> +    %email_hash_name =3D ();
> +    %email_hash_address =3D ();
> +    %commit_author_hash =3D ();
> +    %commit_signer_hash =3D ();
> +    @email_to =3D ();
> +    %hash_list_to =3D ();
> +    @list_to =3D ();
> +    @scm =3D ();
> +    @web =3D ();
> +    @subsystem =3D ();
> +    @status =3D ();
> +    %deduplicate_name_hash =3D ();
> +    %deduplicate_address_hash =3D ();
> +    if ($email_git_all_signature_types) {
> +	$signature_pattern =3D "(.+?)[Bb][Yy]:";
> +    } else {
> +	$signature_pattern =3D "\(" . join("|", @signature_tags) . "\)";
> +    }
> +
> +    # Find responsible parties
> +
> +    my %exact_pattern_match_hash =3D ();
> +
> +    foreach my $file (@files) {
> +
> +	my %hash;
> +	my $tvi =3D find_first_section();
> +	while ($tvi < @typevalue) {
> +	    my $start =3D find_starting_index($tvi);
> +	    my $end =3D find_ending_index($tvi);
> +	    my $exclude =3D 0;
> +	    my $i;
> +
> +	    #Do not match excluded file patterns
> +
> +	    for ($i =3D $start; $i < $end; $i++) {
> +		my $line =3D $typevalue[$i];
> +		if ($line =3D~ m/^([A-Z]):\s*(.*)/) {
> +		    my $type =3D $1;
> +		    my $value =3D $2;
> +		    if ($type eq 'X') {
> +			if (file_match_pattern($file, $value)) {
> +			    $exclude =3D 1;
> +			    last;
> +			}
> +		    }
> +		}
> +	    }
> +
> +	    if (!$exclude) {
> +		for ($i =3D $start; $i < $end; $i++) {
> +		    my $line =3D $typevalue[$i];
> +		    if ($line =3D~ m/^([A-Z]):\s*(.*)/) {
> +			my $type =3D $1;
> +			my $value =3D $2;
> +			if ($type eq 'F') {
> +			    if (file_match_pattern($file, $value)) {
> +				my $value_pd =3D ($value =3D~ tr@/@@);
> +				my $file_pd =3D ($file  =3D~ tr@/@@);
> +				$value_pd++ if (substr($value,-1,1) ne "/");
> +				$value_pd =3D -1 if ($value =3D~ /^\.\*/);
> +				if ($value_pd >=3D $file_pd &&
> +				    range_is_maintained($start, $end) &&
> +				    range_has_maintainer($start, $end)) {
> +				    $exact_pattern_match_hash{$file} =3D 1;
> +				}
> +				if ($pattern_depth =3D=3D 0 ||
> +				    (($file_pd - $value_pd) < $pattern_depth)) {
> +				    $hash{$tvi} =3D $value_pd;
> +				}
> +			    }
> +			} elsif ($type eq 'N') {
> +			    if ($file =3D~ m/$value/x) {
> +				$hash{$tvi} =3D 0;
> +			    }
> +			}
> +		    }
> +		}
> +	    }
> +	    $tvi =3D $end + 1;
> +	}
> +
> +	foreach my $line (sort {$hash{$b} <=3D> $hash{$a}} keys %hash) {
> +	    add_categories($line);
> +	    if ($sections) {
> +		my $i;
> +		my $start =3D find_starting_index($line);
> +		my $end =3D find_ending_index($line);
> +		for ($i =3D $start; $i < $end; $i++) {
> +		    my $line =3D $typevalue[$i];
> +		    if ($line =3D~ /^[FX]:/) {		##Restore file patterns
> +			$line =3D~ s/([^\\])\.([^\*])/$1\?$2/g;
> +			$line =3D~ s/([^\\])\.$/$1\?/g;	##Convert . back to ?
> +			$line =3D~ s/\\\./\./g;       	##Convert \. to .
> +			$line =3D~ s/\.\*/\*/g;       	##Convert .* to *
> +		    }
> +		    my $count =3D $line =3D~ s/^([A-Z]):/$1:\t/g;
> +		    if ($letters eq "" || (!$count || $letters =3D~ /$1/i)) {
> +			print("$line\n");
> +		    }
> +		}
> +		print("\n");
> +	    }
> +	}
> +
> +	maintainers_in_file($file);
> +    }
> +
> +    if ($keywords) {
> +	@keyword_tvi =3D sort_and_uniq(@keyword_tvi);
> +	foreach my $line (@keyword_tvi) {
> +	    add_categories($line);
> +	}
> +    }
> +
> +    foreach my $email (@email_to, @list_to) {
> +	$email->[0] =3D deduplicate_email($email->[0]);
> +    }
> +
> +    foreach my $file (@files) {
> +	if ($email &&
> +	    ($email_git ||
> +	     ($email_git_fallback &&
> +	      $file !~ /MAINTAINERS$/ &&
> +	      !$exact_pattern_match_hash{$file}))) {
> +	    vcs_file_signoffs($file);
> +	}
> +	if ($email && $email_git_blame) {
> +	    vcs_file_blame($file);
> +	}
> +    }
> +
> +    if ($email) {
> +	foreach my $chief (@penguin_chief) {
> +	    if ($chief =3D~ m/^(.*):(.*)/) {
> +		my $email_address;
> +
> +		$email_address =3D format_email($1, $2, $email_usename);
> +		if ($email_git_penguin_chiefs) {
> +		    push(@email_to, [$email_address, 'chief penguin']);
> +		} else {
> +		    @email_to =3D grep($_->[0] !~ /${email_address}/, @email_to);
> +		}
> +	    }
> +	}
> +
> +	foreach my $email (@file_emails) {
> +	    $email =3D mailmap_email($email);
> +	    my ($name, $address) =3D parse_email($email);
> +
> +	    my $tmp_email =3D format_email($name, $address, $email_usename);
> +	    push_email_address($tmp_email, '');
> +	    add_role($tmp_email, 'in file');
> +	}
> +    }
> +
> +    foreach my $fix (@fixes) {
> +	vcs_add_commit_signers($fix, "blamed_fixes");
> +    }
> +
> +    my @to =3D ();
> +    if ($email || $email_list) {
> +	if ($email) {
> +	    @to =3D (@to, @email_to);
> +	}
> +	if ($email_list) {
> +	    @to =3D (@to, @list_to);
> +	}
> +    }
> +
> +    if ($interactive) {
> +	@to =3D interactive_get_maintainers(\@to);
> +    }
> +
> +    return @to;
> +}
> +
> +sub file_match_pattern {
> +    my ($file, $pattern) =3D @_;
> +    if (substr($pattern, -1) eq "/") {
> +	if ($file =3D~ m@^$pattern@) {
> +	    return 1;
> +	}
> +    } else {
> +	if ($file =3D~ m@^$pattern@) {
> +	    my $s1 =3D ($file =3D~ tr@/@@);
> +	    my $s2 =3D ($pattern =3D~ tr@/@@);
> +	    if ($s1 =3D=3D $s2) {
> +		return 1;
> +	    }
> +	}
> +    }
> +    return 0;
> +}
> +
> +sub usage {
> +    print <<EOT;
> +usage: $P [options] patchfile
> +       $P [options] -f file|directory
> +version: $V
> +
> +MAINTAINER field selection options:
> +  --email =3D> print email address(es) if any
> +    --git =3D> include recent git \*-by: signers
> +    --git-all-signature-types =3D> include signers regardless of signatu=
re type
> +        or use only ${signature_pattern} signers (default: $email_git_al=
l_signature_types)
> +    --git-fallback =3D> use git when no exact MAINTAINERS pattern (defau=
lt: $email_git_fallback)
> +    --git-chief-penguins =3D> include ${penguin_chiefs}
> +    --git-min-signatures =3D> number of signatures required (default: $e=
mail_git_min_signatures)
> +    --git-max-maintainers =3D> maximum maintainers to add (default: $ema=
il_git_max_maintainers)
> +    --git-min-percent =3D> minimum percentage of commits required (defau=
lt: $email_git_min_percent)
> +    --git-blame =3D> use git blame to find modified commits for patch or=
 file
> +    --git-blame-signatures =3D> when used with --git-blame, also include=
 all commit signers
> +    --git-since =3D> git history to use (default: $email_git_since)
> +    --hg-since =3D> hg history to use (default: $email_hg_since)
> +    --interactive =3D> display a menu (mostly useful if used with the --=
git option)
> +    --m =3D> include maintainer(s) if any
> +    --r =3D> include reviewer(s) if any
> +    --n =3D> include name 'Full Name <addr\@domain.tld>'
> +    --l =3D> include list(s) if any
> +    --moderated =3D> include moderated lists(s) if any (default: true)
> +    --s =3D> include subscriber only list(s) if any (default: false)
> +    --remove-duplicates =3D> minimize duplicate email names/addresses
> +    --roles =3D> show roles (status:subsystem, git-signer, list, etc...)
> +    --rolestats =3D> show roles and statistics (commits/total_commits, %)
> +    --file-emails =3D> add email addresses found in -f file (default: 0 =
(off))
> +    --fixes =3D> for patches, add signatures of commits with 'Fixes: <co=
mmit>' (default: 1 (on))
> +  --scm =3D> print SCM tree(s) if any
> +  --status =3D> print status if any
> +  --subsystem =3D> print subsystem name if any
> +  --web =3D> print website(s) if any
> +
> +Output type options:
> +  --separator [, ] =3D> separator for multiple entries on 1 line
> +    using --separator also sets --nomultiline if --separator is not [, ]
> +  --multiline =3D> print 1 entry per line
> +
> +Other options:
> +  --pattern-depth =3D> Number of pattern directory traversals (default: =
0 (all))
> +  --keywords =3D> scan patch for keywords (default: $keywords)
> +  --sections =3D> print all of the subsystem sections with pattern match=
es
> +  --letters =3D> print all matching 'letter' types from all matching sec=
tions
> +  --mailmap =3D> use .mailmap file (default: $email_use_mailmap)
> +  --no-tree =3D> run without a kernel tree
> +  --self-test =3D> show potential issues with MAINTAINERS file content
> +  --version =3D> show version
> +  --help =3D> show this help information
> +
> +Default options:
> +  [--email --tree --nogit --git-fallback --m --r --n --l --multiline
> +   --pattern-depth=3D0 --remove-duplicates --rolestats]
> +
> +Notes:
> +  Using "-f directory" may give unexpected results:
> +      Used with "--git", git signators for _all_ files in and below
> +          directory are examined as git recurses directories.
> +          Any specified X: (exclude) pattern matches are _not_ ignored.
> +      Used with "--nogit", directory is used as a pattern match,
> +          no individual file within the directory or subdirectory
> +          is matched.
> +      Used with "--git-blame", does not iterate all files in directory
> +  Using "--git-blame" is slow and may add old committers and authors
> +      that are no longer active maintainers to the output.
> +  Using "--roles" or "--rolestats" with git send-email --cc-cmd or any
> +      other automated tools that expect only ["name"] <email address>
> +      may not work because of additional output after <email address>.
> +  Using "--rolestats" and "--git-blame" shows the #/total=3D% commits,
> +      not the percentage of the entire file authored.  # of commits is
> +      not a good measure of amount of code authored.  1 major commit may
> +      contain a thousand lines, 5 trivial commits may modify a single li=
ne.
> +  If git is not installed, but mercurial (hg) is installed and an .hg
> +      repository exists, the following options apply to mercurial:
> +          --git,
> +          --git-min-signatures, --git-max-maintainers, --git-min-percent=
, and
> +          --git-blame
> +      Use --hg-since not --git-since to control date selection
> +  File ".get_maintainer.conf", if it exists in the fstests source root
> +      directory, can change whatever get_maintainer defaults are desired.
> +      Entries in this file can be any command line argument.
> +      This file is prepended to any additional command line arguments.
> +      Multiple lines and # comments are allowed.
> +  Most options have both positive and negative forms.
> +      The negative forms for --<foo> are --no<foo> and --no-<foo>.
> +
> +EOT
> +}
> +
> +sub top_of_fstests_tree {
> +    my ($lk_path) =3D @_;
> +
> +    if ($lk_path ne "" && substr($lk_path,length($lk_path)-1,1) ne "/") {
> +	$lk_path .=3D "/";
> +    }
> +    if (   (-f "${lk_path}check")
> +	&& (-f "${lk_path}local.config.example")
> +	&& (-e "${lk_path}MAINTAINERS")
> +	&& (-f "${lk_path}Makefile")
> +	&& (-f "${lk_path}README")
> +	&& (-f "${lk_path}new")
> +	&& (-d "${lk_path}LICENSES")
> +	&& (-d "${lk_path}tests")
> +	&& (-d "${lk_path}common")
> +	&& (-d "${lk_path}src")
> +	&& (-d "${lk_path}tools")
> +	&& (-d "${lk_path}include")
> +	&& (-d "${lk_path}m4")
> +	&& (-d "${lk_path}lib")
> +	&& (-d "${lk_path}doc")) {
> +	return 1;
> +    }
> +    return 0;
> +}
> +
> +sub parse_email {
> +    my ($formatted_email) =3D @_;
> +
> +    my $name =3D "";
> +    my $address =3D "";
> +
> +    if ($formatted_email =3D~ /^([^<]+)<(.+\@.*)>.*$/) {
> +	$name =3D $1;
> +	$address =3D $2;
> +    } elsif ($formatted_email =3D~ /^\s*<(.+\@\S*)>.*$/) {
> +	$address =3D $1;
> +    } elsif ($formatted_email =3D~ /^(.+\@\S*).*$/) {
> +	$address =3D $1;
> +    }
> +
> +    $name =3D~ s/^\s+|\s+$//g;
> +    $name =3D~ s/^\"|\"$//g;
> +    $address =3D~ s/^\s+|\s+$//g;
> +
> +    if ($name =3D~ /[^\w \-]/i) {  	 ##has "must quote" chars
> +	$name =3D~ s/(?<!\\)"/\\"/g;       ##escape quotes
> +	$name =3D "\"$name\"";
> +    }
> +
> +    return ($name, $address);
> +}
> +
> +sub format_email {
> +    my ($name, $address, $usename) =3D @_;
> +
> +    my $formatted_email;
> +
> +    $name =3D~ s/^\s+|\s+$//g;
> +    $name =3D~ s/^\"|\"$//g;
> +    $address =3D~ s/^\s+|\s+$//g;
> +
> +    if ($name =3D~ /[^\w \-]/i) {          ##has "must quote" chars
> +	$name =3D~ s/(?<!\\)"/\\"/g;       ##escape quotes
> +	$name =3D "\"$name\"";
> +    }
> +
> +    if ($usename) {
> +	if ("$name" eq "") {
> +	    $formatted_email =3D "$address";
> +	} else {
> +	    $formatted_email =3D "$name <$address>";
> +	}
> +    } else {
> +	$formatted_email =3D $address;
> +    }
> +
> +    return $formatted_email;
> +}
> +
> +sub find_first_section {
> +    my $index =3D 0;
> +
> +    while ($index < @typevalue) {
> +	my $tv =3D $typevalue[$index];
> +	if (($tv =3D~ m/^([A-Z]):\s*(.*)/)) {
> +	    last;
> +	}
> +	$index++;
> +    }
> +
> +    return $index;
> +}
> +
> +sub find_starting_index {
> +    my ($index) =3D @_;
> +
> +    while ($index > 0) {
> +	my $tv =3D $typevalue[$index];
> +	if (!($tv =3D~ m/^([A-Z]):\s*(.*)/)) {
> +	    last;
> +	}
> +	$index--;
> +    }
> +
> +    return $index;
> +}
> +
> +sub find_ending_index {
> +    my ($index) =3D @_;
> +
> +    while ($index < @typevalue) {
> +	my $tv =3D $typevalue[$index];
> +	if (!($tv =3D~ m/^([A-Z]):\s*(.*)/)) {
> +	    last;
> +	}
> +	$index++;
> +    }
> +
> +    return $index;
> +}
> +
> +sub get_subsystem_name {
> +    my ($index) =3D @_;
> +
> +    my $start =3D find_starting_index($index);
> +
> +    my $subsystem =3D $typevalue[$start];
> +    if ($output_section_maxlen && length($subsystem) > $output_section_m=
axlen) {
> +	$subsystem =3D substr($subsystem, 0, $output_section_maxlen - 3);
> +	$subsystem =3D~ s/\s*$//;
> +	$subsystem =3D $subsystem . "...";
> +    }
> +    return $subsystem;
> +}
> +
> +sub get_maintainer_role {
> +    my ($index) =3D @_;
> +
> +    my $i;
> +    my $start =3D find_starting_index($index);
> +    my $end =3D find_ending_index($index);
> +
> +    my $role =3D "unknown";
> +    my $subsystem =3D get_subsystem_name($index);
> +
> +    for ($i =3D $start + 1; $i < $end; $i++) {
> +	my $tv =3D $typevalue[$i];
> +	if ($tv =3D~ m/^([A-Z]):\s*(.*)/) {
> +	    my $ptype =3D $1;
> +	    my $pvalue =3D $2;
> +	    if ($ptype eq "S") {
> +		$role =3D $pvalue;
> +	    }
> +	}
> +    }
> +
> +    $role =3D lc($role);
> +    if      ($role eq "supported") {
> +	$role =3D "supporter";
> +    } elsif ($role eq "maintained") {
> +	$role =3D "maintainer";
> +    } elsif ($role eq "odd fixes") {
> +	$role =3D "odd fixer";
> +    } elsif ($role eq "orphan") {
> +	$role =3D "orphan minder";
> +    } elsif ($role eq "obsolete") {
> +	$role =3D "obsolete minder";
> +    } elsif ($role eq "buried alive in reporters") {
> +	$role =3D "chief penguin";
> +    }
> +
> +    return $role . ":" . $subsystem;
> +}
> +
> +sub get_list_role {
> +    my ($index) =3D @_;
> +
> +    my $subsystem =3D get_subsystem_name($index);
> +
> +    if ($subsystem eq "ALL") {
> +	$subsystem =3D "Send To Me";
> +    }
> +
> +    return $subsystem;
> +}
> +
> +sub add_categories {
> +    my ($index) =3D @_;
> +
> +    my $i;
> +    my $start =3D find_starting_index($index);
> +    my $end =3D find_ending_index($index);
> +
> +    push(@subsystem, $typevalue[$start]);
> +
> +    for ($i =3D $start + 1; $i < $end; $i++) {
> +	my $tv =3D $typevalue[$i];
> +	if ($tv =3D~ m/^([A-Z]):\s*(.*)/) {
> +	    my $ptype =3D $1;
> +	    my $pvalue =3D $2;
> +	    if ($ptype eq "L") {
> +		my $list_address =3D $pvalue;
> +		my $list_additional =3D "";
> +		my $list_role =3D get_list_role($i);
> +
> +		if ($list_role ne "") {
> +		    $list_role =3D ":" . $list_role;
> +		}
> +		if ($list_address =3D~ m/([^\s]+)\s+(.*)$/) {
> +		    $list_address =3D $1;
> +		    $list_additional =3D $2;
> +		}
> +		if ($list_additional =3D~ m/subscribers-only/) {
> +		    if ($email_subscriber_list) {
> +			if (!$hash_list_to{lc($list_address)}) {
> +			    $hash_list_to{lc($list_address)} =3D 1;
> +			    push(@list_to, [$list_address,
> +					    "subscriber list${list_role}"]);
> +			}
> +		    }
> +		} else {
> +		    if ($email_list) {
> +			if (!$hash_list_to{lc($list_address)}) {
> +			    if ($list_additional =3D~ m/moderated/) {
> +				if ($email_moderated_list) {
> +				    $hash_list_to{lc($list_address)} =3D 1;
> +				    push(@list_to, [$list_address,
> +						    "moderated list${list_role}"]);
> +				}
> +			    } else {
> +				$hash_list_to{lc($list_address)} =3D 1;
> +				push(@list_to, [$list_address,
> +						"open list${list_role}"]);
> +			    }
> +			}
> +		    }
> +		}
> +	    } elsif ($ptype eq "M") {
> +		if ($email_maintainer) {
> +		    my $role =3D get_maintainer_role($i);
> +		    push_email_addresses($pvalue, $role);
> +		}
> +	    } elsif ($ptype eq "R") {
> +		if ($email_reviewer) {
> +		    my $subsystem =3D get_subsystem_name($i);
> +		    push_email_addresses($pvalue, "reviewer:$subsystem");
> +		}
> +	    } elsif ($ptype eq "T") {
> +		push(@scm, $pvalue);
> +	    } elsif ($ptype eq "W") {
> +		push(@web, $pvalue);
> +	    } elsif ($ptype eq "S") {
> +		push(@status, $pvalue);
> +	    }
> +	}
> +    }
> +}
> +
> +sub email_inuse {
> +    my ($name, $address) =3D @_;
> +
> +    return 1 if (($name eq "") && ($address eq ""));
> +    return 1 if (($name ne "") && exists($email_hash_name{lc($name)}));
> +    return 1 if (($address ne "") && exists($email_hash_address{lc($addr=
ess)}));
> +
> +    return 0;
> +}
> +
> +sub push_email_address {
> +    my ($line, $role) =3D @_;
> +
> +    my ($name, $address) =3D parse_email($line);
> +
> +    if ($address eq "") {
> +	return 0;
> +    }
> +
> +    if (!$email_remove_duplicates) {
> +	push(@email_to, [format_email($name, $address, $email_usename), $role]);
> +    } elsif (!email_inuse($name, $address)) {
> +	push(@email_to, [format_email($name, $address, $email_usename), $role]);
> +	$email_hash_name{lc($name)}++ if ($name ne "");
> +	$email_hash_address{lc($address)}++;
> +    }
> +
> +    return 1;
> +}
> +
> +sub push_email_addresses {
> +    my ($address, $role) =3D @_;
> +
> +    my @address_list =3D ();
> +
> +    if (rfc822_valid($address)) {
> +	push_email_address($address, $role);
> +    } elsif (@address_list =3D rfc822_validlist($address)) {
> +	my $array_count =3D shift(@address_list);
> +	while (my $entry =3D shift(@address_list)) {
> +	    push_email_address($entry, $role);
> +	}
> +    } else {
> +	if (!push_email_address($address, $role)) {
> +	    warn("Invalid MAINTAINERS address: '" . $address . "'\n");
> +	}
> +    }
> +}
> +
> +sub add_role {
> +    my ($line, $role) =3D @_;
> +
> +    my ($name, $address) =3D parse_email($line);
> +    my $email =3D format_email($name, $address, $email_usename);
> +
> +    foreach my $entry (@email_to) {
> +	if ($email_remove_duplicates) {
> +	    my ($entry_name, $entry_address) =3D parse_email($entry->[0]);
> +	    if (($name eq $entry_name || $address eq $entry_address)
> +		&& ($role eq "" || !($entry->[1] =3D~ m/$role/))
> +	    ) {
> +		if ($entry->[1] eq "") {
> +		    $entry->[1] =3D "$role";
> +		} else {
> +		    $entry->[1] =3D "$entry->[1],$role";
> +		}
> +	    }
> +	} else {
> +	    if ($email eq $entry->[0]
> +		&& ($role eq "" || !($entry->[1] =3D~ m/$role/))
> +	    ) {
> +		if ($entry->[1] eq "") {
> +		    $entry->[1] =3D "$role";
> +		} else {
> +		    $entry->[1] =3D "$entry->[1],$role";
> +		}
> +	    }
> +	}
> +    }
> +}
> +
> +sub which {
> +    my ($bin) =3D @_;
> +
> +    foreach my $path (split(/:/, $ENV{PATH})) {
> +	if (-e "$path/$bin") {
> +	    return "$path/$bin";
> +	}
> +    }
> +
> +    return "";
> +}
> +
> +sub which_conf {
> +    my ($conf) =3D @_;
> +
> +    foreach my $path (split(/:/, ".:$ENV{HOME}:.scripts")) {
> +	if (-e "$path/$conf") {
> +	    return "$path/$conf";
> +	}
> +    }
> +
> +    return "";
> +}
> +
> +sub mailmap_email {
> +    my ($line) =3D @_;
> +
> +    my ($name, $address) =3D parse_email($line);
> +    my $email =3D format_email($name, $address, 1);
> +    my $real_name =3D $name;
> +    my $real_address =3D $address;
> +
> +    if (exists $mailmap->{names}->{$email} ||
> +	exists $mailmap->{addresses}->{$email}) {
> +	if (exists $mailmap->{names}->{$email}) {
> +	    $real_name =3D $mailmap->{names}->{$email};
> +	}
> +	if (exists $mailmap->{addresses}->{$email}) {
> +	    $real_address =3D $mailmap->{addresses}->{$email};
> +	}
> +    } else {
> +	if (exists $mailmap->{names}->{$address}) {
> +	    $real_name =3D $mailmap->{names}->{$address};
> +	}
> +	if (exists $mailmap->{addresses}->{$address}) {
> +	    $real_address =3D $mailmap->{addresses}->{$address};
> +	}
> +    }
> +    return format_email($real_name, $real_address, 1);
> +}
> +
> +sub mailmap {
> +    my (@addresses) =3D @_;
> +
> +    my @mapped_emails =3D ();
> +    foreach my $line (@addresses) {
> +	push(@mapped_emails, mailmap_email($line));
> +    }
> +    merge_by_realname(@mapped_emails) if ($email_use_mailmap);
> +    return @mapped_emails;
> +}
> +
> +sub merge_by_realname {
> +    my %address_map;
> +    my (@emails) =3D @_;
> +
> +    foreach my $email (@emails) {
> +	my ($name, $address) =3D parse_email($email);
> +	if (exists $address_map{$name}) {
> +	    $address =3D $address_map{$name};
> +	    $email =3D format_email($name, $address, 1);
> +	} else {
> +	    $address_map{$name} =3D $address;
> +	}
> +    }
> +}
> +
> +sub git_execute_cmd {
> +    my ($cmd) =3D @_;
> +    my @lines =3D ();
> +
> +    my $output =3D `$cmd`;
> +    $output =3D~ s/^\s*//gm;
> +    @lines =3D split("\n", $output);
> +
> +    return @lines;
> +}
> +
> +sub hg_execute_cmd {
> +    my ($cmd) =3D @_;
> +    my @lines =3D ();
> +
> +    my $output =3D `$cmd`;
> +    @lines =3D split("\n", $output);
> +
> +    return @lines;
> +}
> +
> +sub extract_formatted_signatures {
> +    my (@signature_lines) =3D @_;
> +
> +    my @type =3D @signature_lines;
> +
> +    s/\s*(.*):.*/$1/ for (@type);
> +
> +    # cut -f2- -d":"
> +    s/\s*.*:\s*(.+)\s*/$1/ for (@signature_lines);
> +
> +## Reformat email addresses (with names) to avoid badly written signatur=
es
> +
> +    foreach my $signer (@signature_lines) {
> +	$signer =3D deduplicate_email($signer);
> +    }
> +
> +    return (\@type, \@signature_lines);
> +}
> +
> +sub vcs_find_signers {
> +    my ($cmd, $file) =3D @_;
> +    my $commits;
> +    my @lines =3D ();
> +    my @signatures =3D ();
> +    my @authors =3D ();
> +    my @stats =3D ();
> +
> +    @lines =3D &{$VCS_cmds{"execute_cmd"}}($cmd);
> +
> +    my $pattern =3D $VCS_cmds{"commit_pattern"};
> +    my $author_pattern =3D $VCS_cmds{"author_pattern"};
> +    my $stat_pattern =3D $VCS_cmds{"stat_pattern"};
> +
> +    $stat_pattern =3D~ s/(\$\w+)/$1/eeg;		#interpolate $stat_pattern
> +
> +    $commits =3D grep(/$pattern/, @lines);	# of commits
> +
> +    @authors =3D grep(/$author_pattern/, @lines);
> +    @signatures =3D grep(/^[ \t]*${signature_pattern}.*\@.*$/, @lines);
> +    @stats =3D grep(/$stat_pattern/, @lines);
> +
> +#    print("stats: <@stats>\n");
> +
> +    return (0, \@signatures, \@authors, \@stats) if !@signatures;
> +
> +    save_commits_by_author(@lines) if ($interactive);
> +    save_commits_by_signer(@lines) if ($interactive);
> +
> +    if (!$email_git_penguin_chiefs) {
> +	@signatures =3D grep(!/${penguin_chiefs}/i, @signatures);
> +    }
> +
> +    my ($author_ref, $authors_ref) =3D extract_formatted_signatures(@aut=
hors);
> +    my ($types_ref, $signers_ref) =3D extract_formatted_signatures(@sign=
atures);
> +
> +    return ($commits, $signers_ref, $authors_ref, \@stats);
> +}
> +
> +sub vcs_find_author {
> +    my ($cmd) =3D @_;
> +    my @lines =3D ();
> +
> +    @lines =3D &{$VCS_cmds{"execute_cmd"}}($cmd);
> +
> +    if (!$email_git_penguin_chiefs) {
> +	@lines =3D grep(!/${penguin_chiefs}/i, @lines);
> +    }
> +
> +    return @lines if !@lines;
> +
> +    my @authors =3D ();
> +    foreach my $line (@lines) {
> +	if ($line =3D~ m/$VCS_cmds{"author_pattern"}/) {
> +	    my $author =3D $1;
> +	    my ($name, $address) =3D parse_email($author);
> +	    $author =3D format_email($name, $address, 1);
> +	    push(@authors, $author);
> +	}
> +    }
> +
> +    save_commits_by_author(@lines) if ($interactive);
> +    save_commits_by_signer(@lines) if ($interactive);
> +
> +    return @authors;
> +}
> +
> +sub vcs_save_commits {
> +    my ($cmd) =3D @_;
> +    my @lines =3D ();
> +    my @commits =3D ();
> +
> +    @lines =3D &{$VCS_cmds{"execute_cmd"}}($cmd);
> +
> +    foreach my $line (@lines) {
> +	if ($line =3D~ m/$VCS_cmds{"blame_commit_pattern"}/) {
> +	    push(@commits, $1);
> +	}
> +    }
> +
> +    return @commits;
> +}
> +
> +sub vcs_blame {
> +    my ($file) =3D @_;
> +    my $cmd;
> +    my @commits =3D ();
> +
> +    return @commits if (!(-f $file));
> +
> +    if (@range && $VCS_cmds{"blame_range_cmd"} eq "") {
> +	my @all_commits =3D ();
> +
> +	$cmd =3D $VCS_cmds{"blame_file_cmd"};
> +	$cmd =3D~ s/(\$\w+)/$1/eeg;		#interpolate $cmd
> +	@all_commits =3D vcs_save_commits($cmd);
> +
> +	foreach my $file_range_diff (@range) {
> +	    next if (!($file_range_diff =3D~ m/(.+):(.+):(.+)/));
> +	    my $diff_file =3D $1;
> +	    my $diff_start =3D $2;
> +	    my $diff_length =3D $3;
> +	    next if ("$file" ne "$diff_file");
> +	    for (my $i =3D $diff_start; $i < $diff_start + $diff_length; $i++) {
> +		push(@commits, $all_commits[$i]);
> +	    }
> +	}
> +    } elsif (@range) {
> +	foreach my $file_range_diff (@range) {
> +	    next if (!($file_range_diff =3D~ m/(.+):(.+):(.+)/));
> +	    my $diff_file =3D $1;
> +	    my $diff_start =3D $2;
> +	    my $diff_length =3D $3;
> +	    next if ("$file" ne "$diff_file");
> +	    $cmd =3D $VCS_cmds{"blame_range_cmd"};
> +	    $cmd =3D~ s/(\$\w+)/$1/eeg;		#interpolate $cmd
> +	    push(@commits, vcs_save_commits($cmd));
> +	}
> +    } else {
> +	$cmd =3D $VCS_cmds{"blame_file_cmd"};
> +	$cmd =3D~ s/(\$\w+)/$1/eeg;		#interpolate $cmd
> +	@commits =3D vcs_save_commits($cmd);
> +    }
> +
> +    foreach my $commit (@commits) {
> +	$commit =3D~ s/^\^//g;
> +    }
> +
> +    return @commits;
> +}
> +
> +my $printed_novcs =3D 0;
> +sub vcs_exists {
> +    %VCS_cmds =3D %VCS_cmds_git;
> +    return 1 if eval $VCS_cmds{"available"};
> +    %VCS_cmds =3D %VCS_cmds_hg;
> +    return 2 if eval $VCS_cmds{"available"};
> +    %VCS_cmds =3D ();
> +    if (!$printed_novcs && $email_git) {
> +	warn("$P: No supported VCS found.  Add --nogit to options?\n");
> +	warn("Using a git repository produces better results.\n");
> +	warn("Try Linus Torvalds' latest git repository using:\n");
> +	warn("git clone git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git\n"=
);
> +	$printed_novcs =3D 1;
> +    }
> +    return 0;
> +}
> +
> +sub vcs_is_git {
> +    vcs_exists();
> +    return $vcs_used =3D=3D 1;
> +}
> +
> +sub vcs_is_hg {
> +    return $vcs_used =3D=3D 2;
> +}
> +
> +sub vcs_add_commit_signers {
> +    return if (!vcs_exists());
> +
> +    my ($commit, $desc) =3D @_;
> +    my $commit_count =3D 0;
> +    my $commit_authors_ref;
> +    my $commit_signers_ref;
> +    my $stats_ref;
> +    my @commit_authors =3D ();
> +    my @commit_signers =3D ();
> +    my $cmd;
> +
> +    $cmd =3D $VCS_cmds{"find_commit_signers_cmd"};
> +    $cmd =3D~ s/(\$\w+)/$1/eeg;	#substitute variables in $cmd
> +
> +    ($commit_count, $commit_signers_ref, $commit_authors_ref, $stats_ref=
) =3D vcs_find_signers($cmd, "");
> +    @commit_authors =3D @{$commit_authors_ref} if defined $commit_author=
s_ref;
> +    @commit_signers =3D @{$commit_signers_ref} if defined $commit_signer=
s_ref;
> +
> +    foreach my $signer (@commit_signers) {
> +	$signer =3D deduplicate_email($signer);
> +    }
> +
> +    vcs_assign($desc, 1, @commit_signers);
> +}
> +
> +sub interactive_get_maintainers {
> +    my ($list_ref) =3D @_;
> +    my @list =3D @$list_ref;
> +
> +    vcs_exists();
> +
> +    my %selected;
> +    my %authored;
> +    my %signed;
> +    my $count =3D 0;
> +    my $maintained =3D 0;
> +    foreach my $entry (@list) {
> +	$maintained =3D 1 if ($entry->[1] =3D~ /^(maintainer|supporter)/i);
> +	$selected{$count} =3D 1;
> +	$authored{$count} =3D 0;
> +	$signed{$count} =3D 0;
> +	$count++;
> +    }
> +
> +    #menu loop
> +    my $done =3D 0;
> +    my $print_options =3D 0;
> +    my $redraw =3D 1;
> +    while (!$done) {
> +	$count =3D 0;
> +	if ($redraw) {
> +	    printf STDERR "\n%1s %2s %-65s",
> +			  "*", "#", "email/list and role:stats";
> +	    if ($email_git ||
> +		($email_git_fallback && !$maintained) ||
> +		$email_git_blame) {
> +		print STDERR "auth sign";
> +	    }
> +	    print STDERR "\n";
> +	    foreach my $entry (@list) {
> +		my $email =3D $entry->[0];
> +		my $role =3D $entry->[1];
> +		my $sel =3D "";
> +		$sel =3D "*" if ($selected{$count});
> +		my $commit_author =3D $commit_author_hash{$email};
> +		my $commit_signer =3D $commit_signer_hash{$email};
> +		my $authored =3D 0;
> +		my $signed =3D 0;
> +		$authored++ for (@{$commit_author});
> +		$signed++ for (@{$commit_signer});
> +		printf STDERR "%1s %2d %-65s", $sel, $count + 1, $email;
> +		printf STDERR "%4d %4d", $authored, $signed
> +		    if ($authored > 0 || $signed > 0);
> +		printf STDERR "\n     %s\n", $role;
> +		if ($authored{$count}) {
> +		    my $commit_author =3D $commit_author_hash{$email};
> +		    foreach my $ref (@{$commit_author}) {
> +			print STDERR "     Author: @{$ref}[1]\n";
> +		    }
> +		}
> +		if ($signed{$count}) {
> +		    my $commit_signer =3D $commit_signer_hash{$email};
> +		    foreach my $ref (@{$commit_signer}) {
> +			print STDERR "     @{$ref}[2]: @{$ref}[1]\n";
> +		    }
> +		}
> +
> +		$count++;
> +	    }
> +	}
> +	my $date_ref =3D \$email_git_since;
> +	$date_ref =3D \$email_hg_since if (vcs_is_hg());
> +	if ($print_options) {
> +	    $print_options =3D 0;
> +	    if (vcs_exists()) {
> +		print STDERR <<EOT
> +
> +Version Control options:
> +g  use git history      [$email_git]
> +gf use git-fallback     [$email_git_fallback]
> +b  use git blame        [$email_git_blame]
> +bs use blame signatures [$email_git_blame_signatures]
> +c# minimum commits      [$email_git_min_signatures]
> +%# min percent          [$email_git_min_percent]
> +d# history to use       [$$date_ref]
> +x# max maintainers      [$email_git_max_maintainers]
> +t  all signature types  [$email_git_all_signature_types]
> +m  use .mailmap         [$email_use_mailmap]
> +EOT
> +	    }
> +	    print STDERR <<EOT
> +
> +Additional options:
> +0  toggle all
> +tm toggle maintainers
> +tg toggle git entries
> +tl toggle open list entries
> +ts toggle subscriber list entries
> +f  emails in file       [$email_file_emails]
> +k  keywords in file     [$keywords]
> +r  remove duplicates    [$email_remove_duplicates]
> +p# pattern match depth  [$pattern_depth]
> +EOT
> +	}
> +	print STDERR
> +"\n#(toggle), A#(author), S#(signed) *(all), ^(none), O(options), Y(appr=
ove): ";
> +
> +	my $input =3D <STDIN>;
> +	chomp($input);
> +
> +	$redraw =3D 1;
> +	my $rerun =3D 0;
> +	my @wish =3D split(/[, ]+/, $input);
> +	foreach my $nr (@wish) {
> +	    $nr =3D lc($nr);
> +	    my $sel =3D substr($nr, 0, 1);
> +	    my $str =3D substr($nr, 1);
> +	    my $val =3D 0;
> +	    $val =3D $1 if $str =3D~ /^(\d+)$/;
> +
> +	    if ($sel eq "y") {
> +		$interactive =3D 0;
> +		$done =3D 1;
> +		$output_rolestats =3D 0;
> +		$output_roles =3D 0;
> +		last;
> +	    } elsif ($nr =3D~ /^\d+$/ && $nr > 0 && $nr <=3D $count) {
> +		$selected{$nr - 1} =3D !$selected{$nr - 1};
> +	    } elsif ($sel eq "*" || $sel eq '^') {
> +		my $toggle =3D 0;
> +		$toggle =3D 1 if ($sel eq '*');
> +		for (my $i =3D 0; $i < $count; $i++) {
> +		    $selected{$i} =3D $toggle;
> +		}
> +	    } elsif ($sel eq "0") {
> +		for (my $i =3D 0; $i < $count; $i++) {
> +		    $selected{$i} =3D !$selected{$i};
> +		}
> +	    } elsif ($sel eq "t") {
> +		if (lc($str) eq "m") {
> +		    for (my $i =3D 0; $i < $count; $i++) {
> +			$selected{$i} =3D !$selected{$i}
> +			    if ($list[$i]->[1] =3D~ /^(maintainer|supporter)/i);
> +		    }
> +		} elsif (lc($str) eq "g") {
> +		    for (my $i =3D 0; $i < $count; $i++) {
> +			$selected{$i} =3D !$selected{$i}
> +			    if ($list[$i]->[1] =3D~ /^(author|commit|signer)/i);
> +		    }
> +		} elsif (lc($str) eq "l") {
> +		    for (my $i =3D 0; $i < $count; $i++) {
> +			$selected{$i} =3D !$selected{$i}
> +			    if ($list[$i]->[1] =3D~ /^(open list)/i);
> +		    }
> +		} elsif (lc($str) eq "s") {
> +		    for (my $i =3D 0; $i < $count; $i++) {
> +			$selected{$i} =3D !$selected{$i}
> +			    if ($list[$i]->[1] =3D~ /^(subscriber list)/i);
> +		    }
> +		}
> +	    } elsif ($sel eq "a") {
> +		if ($val > 0 && $val <=3D $count) {
> +		    $authored{$val - 1} =3D !$authored{$val - 1};
> +		} elsif ($str eq '*' || $str eq '^') {
> +		    my $toggle =3D 0;
> +		    $toggle =3D 1 if ($str eq '*');
> +		    for (my $i =3D 0; $i < $count; $i++) {
> +			$authored{$i} =3D $toggle;
> +		    }
> +		}
> +	    } elsif ($sel eq "s") {
> +		if ($val > 0 && $val <=3D $count) {
> +		    $signed{$val - 1} =3D !$signed{$val - 1};
> +		} elsif ($str eq '*' || $str eq '^') {
> +		    my $toggle =3D 0;
> +		    $toggle =3D 1 if ($str eq '*');
> +		    for (my $i =3D 0; $i < $count; $i++) {
> +			$signed{$i} =3D $toggle;
> +		    }
> +		}
> +	    } elsif ($sel eq "o") {
> +		$print_options =3D 1;
> +		$redraw =3D 1;
> +	    } elsif ($sel eq "g") {
> +		if ($str eq "f") {
> +		    bool_invert(\$email_git_fallback);
> +		} else {
> +		    bool_invert(\$email_git);
> +		}
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "b") {
> +		if ($str eq "s") {
> +		    bool_invert(\$email_git_blame_signatures);
> +		} else {
> +		    bool_invert(\$email_git_blame);
> +		}
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "c") {
> +		if ($val > 0) {
> +		    $email_git_min_signatures =3D $val;
> +		    $rerun =3D 1;
> +		}
> +	    } elsif ($sel eq "x") {
> +		if ($val > 0) {
> +		    $email_git_max_maintainers =3D $val;
> +		    $rerun =3D 1;
> +		}
> +	    } elsif ($sel eq "%") {
> +		if ($str ne "" && $val >=3D 0) {
> +		    $email_git_min_percent =3D $val;
> +		    $rerun =3D 1;
> +		}
> +	    } elsif ($sel eq "d") {
> +		if (vcs_is_git()) {
> +		    $email_git_since =3D $str;
> +		} elsif (vcs_is_hg()) {
> +		    $email_hg_since =3D $str;
> +		}
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "t") {
> +		bool_invert(\$email_git_all_signature_types);
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "f") {
> +		bool_invert(\$email_file_emails);
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "r") {
> +		bool_invert(\$email_remove_duplicates);
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "m") {
> +		bool_invert(\$email_use_mailmap);
> +		read_mailmap();
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "k") {
> +		bool_invert(\$keywords);
> +		$rerun =3D 1;
> +	    } elsif ($sel eq "p") {
> +		if ($str ne "" && $val >=3D 0) {
> +		    $pattern_depth =3D $val;
> +		    $rerun =3D 1;
> +		}
> +	    } elsif ($sel eq "h" || $sel eq "?") {
> +		print STDERR <<EOT
> +
> +Interactive mode allows you to select the various maintainers, submitter=
s,
> +commit signers and mailing lists that could be CC'd on a patch.
> +
> +Any *'d entry is selected.
> +
> +If you have git or hg installed, you can choose to summarize the commit
> +history of files in the patch.  Also, each line of the current file can
> +be matched to its commit author and that commits signers with blame.
> +
> +Various knobs exist to control the length of time for active commit
> +tracking, the maximum number of commit authors and signers to add,
> +and such.
> +
> +Enter selections at the prompt until you are satisfied that the selected
> +maintainers are appropriate.  You may enter multiple selections separated
> +by either commas or spaces.
> +
> +EOT
> +	    } else {
> +		print STDERR "invalid option: '$nr'\n";
> +		$redraw =3D 0;
> +	    }
> +	}
> +	if ($rerun) {
> +	    print STDERR "git-blame can be very slow, please have patience..."
> +		if ($email_git_blame);
> +	    goto &get_maintainers;
> +	}
> +    }
> +
> +    #drop not selected entries
> +    $count =3D 0;
> +    my @new_emailto =3D ();
> +    foreach my $entry (@list) {
> +	if ($selected{$count}) {
> +	    push(@new_emailto, $list[$count]);
> +	}
> +	$count++;
> +    }
> +    return @new_emailto;
> +}
> +
> +sub bool_invert {
> +    my ($bool_ref) =3D @_;
> +
> +    if ($$bool_ref) {
> +	$$bool_ref =3D 0;
> +    } else {
> +	$$bool_ref =3D 1;
> +    }
> +}
> +
> +sub deduplicate_email {
> +    my ($email) =3D @_;
> +
> +    my $matched =3D 0;
> +    my ($name, $address) =3D parse_email($email);
> +    $email =3D format_email($name, $address, 1);
> +    $email =3D mailmap_email($email);
> +
> +    return $email if (!$email_remove_duplicates);
> +
> +    ($name, $address) =3D parse_email($email);
> +
> +    if ($name ne "" && $deduplicate_name_hash{lc($name)}) {
> +	$name =3D $deduplicate_name_hash{lc($name)}->[0];
> +	$address =3D $deduplicate_name_hash{lc($name)}->[1];
> +	$matched =3D 1;
> +    } elsif ($deduplicate_address_hash{lc($address)}) {
> +	$name =3D $deduplicate_address_hash{lc($address)}->[0];
> +	$address =3D $deduplicate_address_hash{lc($address)}->[1];
> +	$matched =3D 1;
> +    }
> +    if (!$matched) {
> +	$deduplicate_name_hash{lc($name)} =3D [ $name, $address ];
> +	$deduplicate_address_hash{lc($address)} =3D [ $name, $address ];
> +    }
> +    $email =3D format_email($name, $address, 1);
> +    $email =3D mailmap_email($email);
> +    return $email;
> +}
> +
> +sub save_commits_by_author {
> +    my (@lines) =3D @_;
> +
> +    my @authors =3D ();
> +    my @commits =3D ();
> +    my @subjects =3D ();
> +
> +    foreach my $line (@lines) {
> +	if ($line =3D~ m/$VCS_cmds{"author_pattern"}/) {
> +	    my $author =3D $1;
> +	    $author =3D deduplicate_email($author);
> +	    push(@authors, $author);
> +	}
> +	push(@commits, $1) if ($line =3D~ m/$VCS_cmds{"commit_pattern"}/);
> +	push(@subjects, $1) if ($line =3D~ m/$VCS_cmds{"subject_pattern"}/);
> +    }
> +
> +    for (my $i =3D 0; $i < @authors; $i++) {
> +	my $exists =3D 0;
> +	foreach my $ref(@{$commit_author_hash{$authors[$i]}}) {
> +	    if (@{$ref}[0] eq $commits[$i] &&
> +		@{$ref}[1] eq $subjects[$i]) {
> +		$exists =3D 1;
> +		last;
> +	    }
> +	}
> +	if (!$exists) {
> +	    push(@{$commit_author_hash{$authors[$i]}},
> +		 [ ($commits[$i], $subjects[$i]) ]);
> +	}
> +    }
> +}
> +
> +sub save_commits_by_signer {
> +    my (@lines) =3D @_;
> +
> +    my $commit =3D "";
> +    my $subject =3D "";
> +
> +    foreach my $line (@lines) {
> +	$commit =3D $1 if ($line =3D~ m/$VCS_cmds{"commit_pattern"}/);
> +	$subject =3D $1 if ($line =3D~ m/$VCS_cmds{"subject_pattern"}/);
> +	if ($line =3D~ /^[ \t]*${signature_pattern}.*\@.*$/) {
> +	    my @signatures =3D ($line);
> +	    my ($types_ref, $signers_ref) =3D extract_formatted_signatures(@sig=
natures);
> +	    my @types =3D @$types_ref;
> +	    my @signers =3D @$signers_ref;
> +
> +	    my $type =3D $types[0];
> +	    my $signer =3D $signers[0];
> +
> +	    $signer =3D deduplicate_email($signer);
> +
> +	    my $exists =3D 0;
> +	    foreach my $ref(@{$commit_signer_hash{$signer}}) {
> +		if (@{$ref}[0] eq $commit &&
> +		    @{$ref}[1] eq $subject &&
> +		    @{$ref}[2] eq $type) {
> +		    $exists =3D 1;
> +		    last;
> +		}
> +	    }
> +	    if (!$exists) {
> +		push(@{$commit_signer_hash{$signer}},
> +		     [ ($commit, $subject, $type) ]);
> +	    }
> +	}
> +    }
> +}
> +
> +sub vcs_assign {
> +    my ($role, $divisor, @lines) =3D @_;
> +
> +    my %hash;
> +    my $count =3D 0;
> +
> +    return if (@lines <=3D 0);
> +
> +    if ($divisor <=3D 0) {
> +	warn("Bad divisor in " . (caller(0))[3] . ": $divisor\n");
> +	$divisor =3D 1;
> +    }
> +
> +    @lines =3D mailmap(@lines);
> +
> +    return if (@lines <=3D 0);
> +
> +    @lines =3D sort(@lines);
> +
> +    # uniq -c
> +    $hash{$_}++ for @lines;
> +
> +    # sort -rn
> +    foreach my $line (sort {$hash{$b} <=3D> $hash{$a}} keys %hash) {
> +	my $sign_offs =3D $hash{$line};
> +	my $percent =3D $sign_offs * 100 / $divisor;
> +
> +	$percent =3D 100 if ($percent > 100);
> +	next if (ignore_email_address($line));
> +	$count++;
> +	last if ($sign_offs < $email_git_min_signatures ||
> +		 $count > $email_git_max_maintainers ||
> +		 $percent < $email_git_min_percent);
> +	push_email_address($line, '');
> +	if ($output_rolestats) {
> +	    my $fmt_percent =3D sprintf("%.0f", $percent);
> +	    add_role($line, "$role:$sign_offs/$divisor=3D$fmt_percent%");
> +	} else {
> +	    add_role($line, $role);
> +	}
> +    }
> +}
> +
> +sub vcs_file_signoffs {
> +    my ($file) =3D @_;
> +
> +    my $authors_ref;
> +    my $signers_ref;
> +    my $stats_ref;
> +    my @authors =3D ();
> +    my @signers =3D ();
> +    my @stats =3D ();
> +    my $commits;
> +
> +    $vcs_used =3D vcs_exists();
> +    return if (!$vcs_used);
> +
> +    my $cmd =3D $VCS_cmds{"find_signers_cmd"};
> +    $cmd =3D~ s/(\$\w+)/$1/eeg;		# interpolate $cmd
> +
> +    ($commits, $signers_ref, $authors_ref, $stats_ref) =3D vcs_find_sign=
ers($cmd, $file);
> +
> +    @signers =3D @{$signers_ref} if defined $signers_ref;
> +    @authors =3D @{$authors_ref} if defined $authors_ref;
> +    @stats =3D @{$stats_ref} if defined $stats_ref;
> +
> +#    print("commits: <$commits>\nsigners:<@signers>\nauthors: <@authors>=
\nstats: <@stats>\n");
> +
> +    foreach my $signer (@signers) {
> +	$signer =3D deduplicate_email($signer);
> +    }
> +
> +    vcs_assign("commit_signer", $commits, @signers);
> +    vcs_assign("authored", $commits, @authors);
> +    if ($#authors =3D=3D $#stats) {
> +	my $stat_pattern =3D $VCS_cmds{"stat_pattern"};
> +	$stat_pattern =3D~ s/(\$\w+)/$1/eeg;	#interpolate $stat_pattern
> +
> +	my $added =3D 0;
> +	my $deleted =3D 0;
> +	for (my $i =3D 0; $i <=3D $#stats; $i++) {
> +	    if ($stats[$i] =3D~ /$stat_pattern/) {
> +		$added +=3D $1;
> +		$deleted +=3D $2;
> +	    }
> +	}
> +	my @tmp_authors =3D uniq(@authors);
> +	foreach my $author (@tmp_authors) {
> +	    $author =3D deduplicate_email($author);
> +	}
> +	@tmp_authors =3D uniq(@tmp_authors);
> +	my @list_added =3D ();
> +	my @list_deleted =3D ();
> +	foreach my $author (@tmp_authors) {
> +	    my $auth_added =3D 0;
> +	    my $auth_deleted =3D 0;
> +	    for (my $i =3D 0; $i <=3D $#stats; $i++) {
> +		if ($author eq deduplicate_email($authors[$i]) &&
> +		    $stats[$i] =3D~ /$stat_pattern/) {
> +		    $auth_added +=3D $1;
> +		    $auth_deleted +=3D $2;
> +		}
> +	    }
> +	    for (my $i =3D 0; $i < $auth_added; $i++) {
> +		push(@list_added, $author);
> +	    }
> +	    for (my $i =3D 0; $i < $auth_deleted; $i++) {
> +		push(@list_deleted, $author);
> +	    }
> +	}
> +	vcs_assign("added_lines", $added, @list_added);
> +	vcs_assign("removed_lines", $deleted, @list_deleted);
> +    }
> +}
> +
> +sub vcs_file_blame {
> +    my ($file) =3D @_;
> +
> +    my @signers =3D ();
> +    my @all_commits =3D ();
> +    my @commits =3D ();
> +    my $total_commits;
> +    my $total_lines;
> +
> +    $vcs_used =3D vcs_exists();
> +    return if (!$vcs_used);
> +
> +    @all_commits =3D vcs_blame($file);
> +    @commits =3D uniq(@all_commits);
> +    $total_commits =3D @commits;
> +    $total_lines =3D @all_commits;
> +
> +    if ($email_git_blame_signatures) {
> +	if (vcs_is_hg()) {
> +	    my $commit_count;
> +	    my $commit_authors_ref;
> +	    my $commit_signers_ref;
> +	    my $stats_ref;
> +	    my @commit_authors =3D ();
> +	    my @commit_signers =3D ();
> +	    my $commit =3D join(" -r ", @commits);
> +	    my $cmd;
> +
> +	    $cmd =3D $VCS_cmds{"find_commit_signers_cmd"};
> +	    $cmd =3D~ s/(\$\w+)/$1/eeg;	#substitute variables in $cmd
> +
> +	    ($commit_count, $commit_signers_ref, $commit_authors_ref, $stats_re=
f) =3D vcs_find_signers($cmd, $file);
> +	    @commit_authors =3D @{$commit_authors_ref} if defined $commit_autho=
rs_ref;
> +	    @commit_signers =3D @{$commit_signers_ref} if defined $commit_signe=
rs_ref;
> +
> +	    push(@signers, @commit_signers);
> +	} else {
> +	    foreach my $commit (@commits) {
> +		my $commit_count;
> +		my $commit_authors_ref;
> +		my $commit_signers_ref;
> +		my $stats_ref;
> +		my @commit_authors =3D ();
> +		my @commit_signers =3D ();
> +		my $cmd;
> +
> +		$cmd =3D $VCS_cmds{"find_commit_signers_cmd"};
> +		$cmd =3D~ s/(\$\w+)/$1/eeg;	#substitute variables in $cmd
> +
> +		($commit_count, $commit_signers_ref, $commit_authors_ref, $stats_ref) =
=3D vcs_find_signers($cmd, $file);
> +		@commit_authors =3D @{$commit_authors_ref} if defined $commit_authors_=
ref;
> +		@commit_signers =3D @{$commit_signers_ref} if defined $commit_signers_=
ref;
> +
> +		push(@signers, @commit_signers);
> +	    }
> +	}
> +    }
> +
> +    if ($from_filename) {
> +	if ($output_rolestats) {
> +	    my @blame_signers;
> +	    if (vcs_is_hg()) {{		# Double brace for last exit
> +		my $commit_count;
> +		my @commit_signers =3D ();
> +		@commits =3D uniq(@commits);
> +		@commits =3D sort(@commits);
> +		my $commit =3D join(" -r ", @commits);
> +		my $cmd;
> +
> +		$cmd =3D $VCS_cmds{"find_commit_author_cmd"};
> +		$cmd =3D~ s/(\$\w+)/$1/eeg;	#substitute variables in $cmd
> +
> +		my @lines =3D ();
> +
> +		@lines =3D &{$VCS_cmds{"execute_cmd"}}($cmd);
> +
> +		if (!$email_git_penguin_chiefs) {
> +		    @lines =3D grep(!/${penguin_chiefs}/i, @lines);
> +		}
> +
> +		last if !@lines;
> +
> +		my @authors =3D ();
> +		foreach my $line (@lines) {
> +		    if ($line =3D~ m/$VCS_cmds{"author_pattern"}/) {
> +			my $author =3D $1;
> +			$author =3D deduplicate_email($author);
> +			push(@authors, $author);
> +		    }
> +		}
> +
> +		save_commits_by_author(@lines) if ($interactive);
> +		save_commits_by_signer(@lines) if ($interactive);
> +
> +		push(@signers, @authors);
> +	    }}
> +	    else {
> +		foreach my $commit (@commits) {
> +		    my $i;
> +		    my $cmd =3D $VCS_cmds{"find_commit_author_cmd"};
> +		    $cmd =3D~ s/(\$\w+)/$1/eeg;	#interpolate $cmd
> +		    my @author =3D vcs_find_author($cmd);
> +		    next if !@author;
> +
> +		    my $formatted_author =3D deduplicate_email($author[0]);
> +
> +		    my $count =3D grep(/$commit/, @all_commits);
> +		    for ($i =3D 0; $i < $count ; $i++) {
> +			push(@blame_signers, $formatted_author);
> +		    }
> +		}
> +	    }
> +	    if (@blame_signers) {
> +		vcs_assign("authored lines", $total_lines, @blame_signers);
> +	    }
> +	}
> +	foreach my $signer (@signers) {
> +	    $signer =3D deduplicate_email($signer);
> +	}
> +	vcs_assign("commits", $total_commits, @signers);
> +    } else {
> +	foreach my $signer (@signers) {
> +	    $signer =3D deduplicate_email($signer);
> +	}
> +	vcs_assign("modified commits", $total_commits, @signers);
> +    }
> +}
> +
> +sub vcs_file_exists {
> +    my ($file) =3D @_;
> +
> +    my $exists;
> +
> +    my $vcs_used =3D vcs_exists();
> +    return 0 if (!$vcs_used);
> +
> +    my $cmd =3D $VCS_cmds{"file_exists_cmd"};
> +    $cmd =3D~ s/(\$\w+)/$1/eeg;		# interpolate $cmd
> +    $cmd .=3D " 2>&1";
> +    $exists =3D &{$VCS_cmds{"execute_cmd"}}($cmd);
> +
> +    return 0 if ($? !=3D 0);
> +
> +    return $exists;
> +}
> +
> +sub vcs_list_files {
> +    my ($file) =3D @_;
> +
> +    my @lsfiles =3D ();
> +
> +    my $vcs_used =3D vcs_exists();
> +    return 0 if (!$vcs_used);
> +
> +    my $cmd =3D $VCS_cmds{"list_files_cmd"};
> +    $cmd =3D~ s/(\$\w+)/$1/eeg;   # interpolate $cmd
> +    @lsfiles =3D &{$VCS_cmds{"execute_cmd"}}($cmd);
> +
> +    return () if ($? !=3D 0);
> +
> +    return @lsfiles;
> +}
> +
> +sub uniq {
> +    my (@parms) =3D @_;
> +
> +    my %saw;
> +    @parms =3D grep(!$saw{$_}++, @parms);
> +    return @parms;
> +}
> +
> +sub sort_and_uniq {
> +    my (@parms) =3D @_;
> +
> +    my %saw;
> +    @parms =3D sort @parms;
> +    @parms =3D grep(!$saw{$_}++, @parms);
> +    return @parms;
> +}
> +
> +sub clean_file_emails {
> +    my (@file_emails) =3D @_;
> +    my @fmt_emails =3D ();
> +
> +    foreach my $email (@file_emails) {
> +	$email =3D~ s/[\(\<\{]{0,1}([A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+)[\)\>\}=
]{0,1}/\<$1\>/g;
> +	my ($name, $address) =3D parse_email($email);
> +	if ($name eq '"[,\.]"') {
> +	    $name =3D "";
> +	}
> +
> +	my @nw =3D split(/[^A-Za-z=C0-=FF\'\,\.\+-]/, $name);
> +	if (@nw > 2) {
> +	    my $first =3D $nw[@nw - 3];
> +	    my $middle =3D $nw[@nw - 2];
> +	    my $last =3D $nw[@nw - 1];
> +
> +	    if (((length($first) =3D=3D 1 && $first =3D~ m/[A-Za-z]/) ||
> +		 (length($first) =3D=3D 2 && substr($first, -1) eq ".")) ||
> +		(length($middle) =3D=3D 1 ||
> +		 (length($middle) =3D=3D 2 && substr($middle, -1) eq "."))) {
> +		$name =3D "$first $middle $last";
> +	    } else {
> +		$name =3D "$middle $last";
> +	    }
> +	}
> +
> +	if (substr($name, -1) =3D~ /[,\.]/) {
> +	    $name =3D substr($name, 0, length($name) - 1);
> +	} elsif (substr($name, -2) =3D~ /[,\.]"/) {
> +	    $name =3D substr($name, 0, length($name) - 2) . '"';
> +	}
> +
> +	if (substr($name, 0, 1) =3D~ /[,\.]/) {
> +	    $name =3D substr($name, 1, length($name) - 1);
> +	} elsif (substr($name, 0, 2) =3D~ /"[,\.]/) {
> +	    $name =3D '"' . substr($name, 2, length($name) - 2);
> +	}
> +
> +	my $fmt_email =3D format_email($name, $address, $email_usename);
> +	push(@fmt_emails, $fmt_email);
> +    }
> +    return @fmt_emails;
> +}
> +
> +sub merge_email {
> +    my @lines;
> +    my %saw;
> +
> +    for (@_) {
> +	my ($address, $role) =3D @$_;
> +	if (!$saw{$address}) {
> +	    if ($output_roles) {
> +		push(@lines, "$address ($role)");
> +	    } else {
> +		push(@lines, $address);
> +	    }
> +	    $saw{$address} =3D 1;
> +	}
> +    }
> +
> +    return @lines;
> +}
> +
> +sub output {
> +    my (@parms) =3D @_;
> +
> +    if ($output_multiline) {
> +	foreach my $line (@parms) {
> +	    print("${line}\n");
> +	}
> +    } else {
> +	print(join($output_separator, @parms));
> +	print("\n");
> +    }
> +}
> +
> +my $rfc822re;
> +
> +sub make_rfc822re {
> +#   Basic lexical tokens are specials, domain_literal, quoted_string, at=
om, and
> +#   comment.  We must allow for rfc822_lwsp (or comments) after each of =
these.
> +#   This regexp will only work on addresses which have had comments stri=
pped
> +#   and replaced with rfc822_lwsp.
> +
> +    my $specials =3D '()<>@,;:\\\\".\\[\\]';
> +    my $controls =3D '\\000-\\037\\177';
> +
> +    my $dtext =3D "[^\\[\\]\\r\\\\]";
> +    my $domain_literal =3D "\\[(?:$dtext|\\\\.)*\\]$rfc822_lwsp*";
> +
> +    my $quoted_string =3D "\"(?:[^\\\"\\r\\\\]|\\\\.|$rfc822_lwsp)*\"$rf=
c822_lwsp*";
> +
> +#   Use zero-width assertion to spot the limit of an atom.  A simple
> +#   $rfc822_lwsp* causes the regexp engine to hang occasionally.
> +    my $atom =3D "[^$specials $controls]+(?:$rfc822_lwsp+|\\Z|(?=3D[\\[\=
"$specials]))";
> +    my $word =3D "(?:$atom|$quoted_string)";
> +    my $localpart =3D "$word(?:\\.$rfc822_lwsp*$word)*";
> +
> +    my $sub_domain =3D "(?:$atom|$domain_literal)";
> +    my $domain =3D "$sub_domain(?:\\.$rfc822_lwsp*$sub_domain)*";
> +
> +    my $addr_spec =3D "$localpart\@$rfc822_lwsp*$domain";
> +
> +    my $phrase =3D "$word*";
> +    my $route =3D "(?:\@$domain(?:,\@$rfc822_lwsp*$domain)*:$rfc822_lwsp=
*)";
> +    my $route_addr =3D "\\<$rfc822_lwsp*$route?$addr_spec\\>$rfc822_lwsp=
*";
> +    my $mailbox =3D "(?:$addr_spec|$phrase$route_addr)";
> +
> +    my $group =3D "$phrase:$rfc822_lwsp*(?:$mailbox(?:,\\s*$mailbox)*)?;=
\\s*";
> +    my $address =3D "(?:$mailbox|$group)";
> +
> +    return "$rfc822_lwsp*$address";
> +}
> +
> +sub rfc822_strip_comments {
> +    my $s =3D shift;
> +#   Recursively remove comments, and replace with a single space.  The s=
impler
> +#   regexps in the Email Addressing FAQ are imperfect - they will miss e=
scaped
> +#   chars in atoms, for example.
> +
> +    while ($s =3D~ s/^((?:[^"\\]|\\.)*
> +                    (?:"(?:[^"\\]|\\.)*"(?:[^"\\]|\\.)*)*)
> +                    \((?:[^()\\]|\\.)*\)/$1 /osx) {}
> +    return $s;
> +}
> +
> +#   valid: returns true if the parameter is an RFC822 valid address
> +#
> +sub rfc822_valid {
> +    my $s =3D rfc822_strip_comments(shift);
> +
> +    if (!$rfc822re) {
> +        $rfc822re =3D make_rfc822re();
> +    }
> +
> +    return $s =3D~ m/^$rfc822re$/so && $s =3D~ m/^$rfc822_char*$/;
> +}
> +
> +#   validlist: In scalar context, returns true if the parameter is an RF=
C822
> +#              valid list of addresses.
> +#
> +#              In list context, returns an empty list on failure (an inv=
alid
> +#              address was found); otherwise a list whose first element =
is the
> +#              number of addresses found and whose remaining elements ar=
e the
> +#              addresses.  This is needed to disambiguate failure (inval=
id)
> +#              from success with no addresses found, because an empty st=
ring is
> +#              a valid list.
> +
> +sub rfc822_validlist {
> +    my $s =3D rfc822_strip_comments(shift);
> +
> +    if (!$rfc822re) {
> +        $rfc822re =3D make_rfc822re();
> +    }
> +    # * null list items are valid according to the RFC
> +    # * the '1' business is to aid in distinguishing failure from no res=
ults
> +
> +    my @r;
> +    if ($s =3D~ m/^(?:$rfc822re)?(?:,(?:$rfc822re)?)*$/so &&
> +	$s =3D~ m/^$rfc822_char*$/) {
> +        while ($s =3D~ m/(?:^|,$rfc822_lwsp*)($rfc822re)/gos) {
> +            push(@r, $1);
> +        }
> +        return wantarray ? (scalar(@r), @r) : 1;
> +    }
> +    return wantarray ? () : 0;
> +}
> -- =

> 2.39.2
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
