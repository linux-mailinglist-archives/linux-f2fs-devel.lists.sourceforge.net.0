Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE501D8DCF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 04:54:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jasOe-0001LG-6H; Tue, 19 May 2020 02:54:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jasOc-0001L7-ER
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 02:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJ7viJ0vVZxDAnfLtWCiV4jAjUrrRAVMZg5QOLiw2zc=; b=ZBfGhGKGXviZHgCExqaqUojwuE
 qW9oVT5evK8PSUmkrBXcZg5qm7tgXs7cK0mOaYIVzJCDmk9D84QXrKUAl4E0kb6QfBG7bBpDgdk0l
 kyqlPzBl+6aOjQW0Z0Kfx3drM039JT8bsAsZ4TUIcXB27/q3ie1Ryvuc8gG/nZxvaLJE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yJ7viJ0vVZxDAnfLtWCiV4jAjUrrRAVMZg5QOLiw2zc=; b=b4sRavt10UReYF6hLOBuv6t3oO
 bte5fpqrIqVol1WXJbZ9AxhfXZKMkzh+ID8gg4M/yrFj2ZwEheMgzqcOSYXIYsWTEvxsxCGxRv2aj
 wQzW+6NPiCZNULlzRYo/cDqyXI7ofDIyTNQRdlkrR6MvZhT8mwH12g+mjNs5UfLtMfho=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jasOa-006fbY-HP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 02:54:22 +0000
Received: from callcc.thunk.org (pool-100-0-195-244.bstnma.fios.verizon.net
 [100.0.195.244]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 04J2rtRb003270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 22:53:56 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 7EB3E420304; Mon, 18 May 2020 22:53:55 -0400 (EDT)
Date: Mon, 18 May 2020 22:53:55 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200519025355.GC2396055@mit.edu>
References: <20200512233251.118314-1-ebiggers@kernel.org>
 <20200512233251.118314-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512233251.118314-4-ebiggers@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jasOa-006fbY-HP
Subject: Re: [f2fs-dev] [PATCH 3/4] fscrypt: support test_dummy_encryption=v2
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 12, 2020 at 04:32:50PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> v1 encryption policies are deprecated in favor of v2, and some new
> features (e.g. encryption+casefolding) are only being added for v2.
> 
> Therefore, the "test_dummy_encryption" mount option (which is used for
> encryption I/O testing with xfstests) needs to support v2 policies.
> 
> To do this, extend its syntax to be "test_dummy_encryption=v1" or
> "test_dummy_encryption=v2".  The existing "test_dummy_encryption" (no
> argument) also continues to be accepted, to specify the default setting
> -- currently v1, but the next patch changes it to v2.
> 
> To cleanly support both v1 and v2 while also making it easy to support
> specifying other encryption settings in the future (say, accepting
> "$contents_mode:$filenames_mode:v2"), make ext4 and f2fs maintain a
> pointer to the dummy fscrypt_context rather than using mount flags.
> 
> To avoid concurrency issues, don't allow test_dummy_encryption to be set
> or changed during a remount.  (The former restriction is new, but
> xfstests doesn't run into it, so no one should notice.)
> 
> Tested with 'gce-xfstests -c {ext4,f2fs}/encrypt -g auto'.  On ext4,
> there are two regressions, both of which are test bugs: ext4/023 and
> ext4/028 fail because they set an xattr and expect it to be stored
> inline, but the increase in size of the fscrypt_context from
> 24 to 40 bytes causes this xattr to be spilled into an external block.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Signed-off-by: Theodore Ts'o <tytso@mit.edu>

Looks good, but could you do me a favor and merge in this?

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index 04bfaf63752c..6c9fc9e21c13 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -293,6 +293,7 @@ EXT4_ATTR_FEATURE(batched_discard);
 EXT4_ATTR_FEATURE(meta_bg_resize);
 #ifdef CONFIG_FS_ENCRYPTION
 EXT4_ATTR_FEATURE(encryption);
+EXT4_ATTR_FEATURE(test_dummy_encryption_v2);
 #endif
 #ifdef CONFIG_UNICODE
 EXT4_ATTR_FEATURE(casefold);
@@ -308,6 +309,7 @@ static struct attribute *ext4_feat_attrs[] = {
 	ATTR_LIST(meta_bg_resize),
 #ifdef CONFIG_FS_ENCRYPTION
 	ATTR_LIST(encryption),
+	ATTR_LIST(test_dummy_encryption_v2),
 #endif
 #ifdef CONFIG_UNICODE
 	ATTR_LIST(casefold),

This will make it easier to have the gce-xfstests test runner know
whether or not test_dummy_encryption=v1 / test_dummy_encryption=v2
will work, and whether test_dummy_encryption tests v1 or v2.

Thanks!

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
