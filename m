Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B05246D6A08
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 19:14:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjkEy-0006kg-VW;
	Tue, 04 Apr 2023 17:14:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1pjkEy-0006ka-9E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Mu5TiPhlDGQslWqHTTqphUGQgluv7cumDZlIZ/iK3Y=; b=g0FmMl4CelWnO5iVPZ/m4pm6Z7
 jD6/gWLdIYJ45jKRe6mx2ZoISOuSTt6s2/ApjIu5ivM98y8+00XzIdZSUJo9YvXnMn9gpAftJbSEX
 rN590KTELWN7uLu2JlGxMbfD6Vs7fXJnCWAe+CgYGNl0DKLKRbyce7Wiw+NmTdCiQaqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Mu5TiPhlDGQslWqHTTqphUGQgluv7cumDZlIZ/iK3Y=; b=BSeiWZc4KH9hLl4vgpmCJD9z6D
 9rTWqoJfr+T5ZNJDG8gV/BFEJzdM6eAdsgFpaClk/AVITzp/QwS7lg6pfrBWLDVFTAjwnJTZ5SlwS
 1C8fAJ7OwiCNPHAPOmWsXiebutPej7EE5bFwbVauLHeO96yLhCbxGEaoCgwOzGYSmris=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjkEx-0001ZR-Rq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76CB363788;
 Tue,  4 Apr 2023 17:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973F7C433A1;
 Tue,  4 Apr 2023 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680628473;
 bh=FsOURgAMeOOBIuj2i3uw5Po7ucebRoFXj4YCGwVLrvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I7N7ZAy1EBEGmuQpK02HSlrey0IX0hh4XCm3MzD1kWYS874FTk0I+jc4w7hH3N4sr
 nopeVd/YVeuILyqiVn2/ekRTuSLgDNpwDZ+C9maHwxxe+JUTqbSPGQgHlW5Gdhy3vX
 oq3RR271cLZ9FnQDLswxrl+GgpPavc1+jpWlZVmrfurz/EQ4YBVrPDwDTS9JiI3XrY
 6hcdooPFrWqMT2i2k+eCJ+zcTf2dWDJTXbKwiovKHQM3wi9z5U262EUVQx0/M+wfZd
 nCS4PJ10VfML64nfyxeFEX36paSGBSjUek8e5KcPzvRDfjBaft6o8cijLpO9UleHpX
 OPw5Tsq+IRTQg==
From: Zorro Lang <zlang@kernel.org>
To: fstests@vger.kernel.org
Date: Wed,  5 Apr 2023 01:14:08 +0800
Message-Id: <20230404171411.699655-3-zlang@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404171411.699655-1-zlang@kernel.org>
References: <20230404171411.699655-1-zlang@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There's not penguin chiefs in fstests,
 so remove related code.
 Signed-off-by: Zorro Lang <zlang@kernel.org> --- tools/get_maintainer.pl
 | 45 + 1 file changed, 1 insertion(+), 44 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjkEx-0001ZR-Rq
Subject: [f2fs-dev] [PATCH 2/5] tools/get_maintainer.pl: remove penguin
 chiefs
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
 ebiggers@google.com, djwong@kernel.org, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, anand.jain@oracle.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 fdmanana@suse.com, ocfs2-devel@oss.oracle.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There's not penguin chiefs in fstests, so remove related code.

Signed-off-by: Zorro Lang <zlang@kernel.org>
---
 tools/get_maintainer.pl | 45 +----------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/tools/get_maintainer.pl b/tools/get_maintainer.pl
index 376c7c02..671ffe26 100755
--- a/tools/get_maintainer.pl
+++ b/tools/get_maintainer.pl
@@ -31,7 +31,6 @@ my $email_fixes = 1;
 my $email_list = 1;
 my $email_moderated_list = 1;
 my $email_subscriber_list = 0;
-my $email_git_penguin_chiefs = 0;
 my $email_git = 0;
 my $email_git_all_signature_types = 0;
 my $email_git_blame = 0;
@@ -79,19 +78,6 @@ my @file_emails = ();
 my %commit_author_hash;
 my %commit_signer_hash;
 
-my @penguin_chief = ();
-push(@penguin_chief, "Zorro Lang:zlang\@kernel.org");
-
-my @penguin_chief_names = ();
-foreach my $chief (@penguin_chief) {
-    if ($chief =~ m/^(.*):(.*)/) {
-	my $chief_name = $1;
-	my $chief_addr = $2;
-	push(@penguin_chief_names, $chief_name);
-    }
-}
-my $penguin_chiefs = "\(" . join("|", @penguin_chief_names) . "\)";
-
 # Signature types of people who are either
 # 	a) responsible for the code in question, or
 # 	b) familiar enough with it to give relevant feedback
@@ -242,7 +228,6 @@ if (!GetOptions(
 		'git-blame!' => \$email_git_blame,
 		'git-blame-signatures!' => \$email_git_blame_signatures,
 		'git-fallback!' => \$email_git_fallback,
-		'git-chief-penguins!' => \$email_git_penguin_chiefs,
 		'git-min-signatures=i' => \$email_git_min_signatures,
 		'git-max-maintainers=i' => \$email_git_max_maintainers,
 		'git-min-percent=i' => \$email_git_min_percent,
@@ -327,7 +312,7 @@ if ($sections || $letters ne "") {
 if ($email &&
     ($email_maintainer + $email_reviewer +
      $email_list + $email_subscriber_list +
-     $email_git + $email_git_penguin_chiefs + $email_git_blame) == 0) {
+     $email_git + $email_git_blame) == 0) {
     die "$P: Please select at least 1 email option\n";
 }
 
@@ -967,19 +952,6 @@ sub get_maintainers {
     }
 
     if ($email) {
-	foreach my $chief (@penguin_chief) {
-	    if ($chief =~ m/^(.*):(.*)/) {
-		my $email_address;
-
-		$email_address = format_email($1, $2, $email_usename);
-		if ($email_git_penguin_chiefs) {
-		    push(@email_to, [$email_address, 'chief penguin']);
-		} else {
-		    @email_to = grep($_->[0] !~ /${email_address}/, @email_to);
-		}
-	    }
-	}
-
 	foreach my $email (@file_emails) {
 	    $email = mailmap_email($email);
 	    my ($name, $address) = parse_email($email);
@@ -1041,7 +1013,6 @@ MAINTAINER field selection options:
     --git-all-signature-types => include signers regardless of signature type
         or use only ${signature_pattern} signers (default: $email_git_all_signature_types)
     --git-fallback => use git when no exact MAINTAINERS pattern (default: $email_git_fallback)
-    --git-chief-penguins => include ${penguin_chiefs}
     --git-min-signatures => number of signatures required (default: $email_git_min_signatures)
     --git-max-maintainers => maximum maintainers to add (default: $email_git_max_maintainers)
     --git-min-percent => minimum percentage of commits required (default: $email_git_min_percent)
@@ -1289,8 +1260,6 @@ sub get_maintainer_role {
 	$role = "orphan minder";
     } elsif ($role eq "obsolete") {
 	$role = "obsolete minder";
-    } elsif ($role eq "buried alive in reporters") {
-	$role = "chief penguin";
     }
 
     return $role . ":" . $subsystem;
@@ -1607,10 +1576,6 @@ sub vcs_find_signers {
     save_commits_by_author(@lines) if ($interactive);
     save_commits_by_signer(@lines) if ($interactive);
 
-    if (!$email_git_penguin_chiefs) {
-	@signatures = grep(!/${penguin_chiefs}/i, @signatures);
-    }
-
     my ($author_ref, $authors_ref) = extract_formatted_signatures(@authors);
     my ($types_ref, $signers_ref) = extract_formatted_signatures(@signatures);
 
@@ -1623,10 +1588,6 @@ sub vcs_find_author {
 
     @lines = &{$VCS_cmds{"execute_cmd"}}($cmd);
 
-    if (!$email_git_penguin_chiefs) {
-	@lines = grep(!/${penguin_chiefs}/i, @lines);
-    }
-
     return @lines if !@lines;
 
     my @authors = ();
@@ -2342,10 +2303,6 @@ sub vcs_file_blame {
 
 		@lines = &{$VCS_cmds{"execute_cmd"}}($cmd);
 
-		if (!$email_git_penguin_chiefs) {
-		    @lines = grep(!/${penguin_chiefs}/i, @lines);
-		}
-
 		last if !@lines;
 
 		my @authors = ();
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
