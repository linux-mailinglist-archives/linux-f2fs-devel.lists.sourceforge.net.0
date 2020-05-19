Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1F1D8E14
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 05:11:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jasf8-00021d-Du; Tue, 19 May 2020 03:11:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jasf7-00021O-4n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 03:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HJhDzghaDus6f0rtvCI2Qsb4c84mmP58u6IsSrwW2iU=; b=PpOjcVub/U/jOQh4HKWiWH4Si6
 JLln3fdS1J+ITugkPal27+eqURGuLzAN4zcNp7f+ZvIeNwM9+Gx44PSpVd++fyGW4g6JWcn1sFOMj
 Zv3F8l6k7pebgRZtH+ghiVd70yJhSADnWY9Y6MzYtIO+fspwwHDMC24xTWZ+8fnRh4Vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HJhDzghaDus6f0rtvCI2Qsb4c84mmP58u6IsSrwW2iU=; b=k+EYvoaXbWKj0ZfIoMk9a/l3f6
 1fSlJ2dN4vxd0bjr67niaQG9rGhYKDeTSjZVKS1Qrgc63wAtMpkDqm/IS36pRgivxDuqdV9sZOzK9
 /NkH3S+Nrc8CN//2HkSKd0ovxM03na4UyodqkWG27jAL2al76BYOxOfdtc7/HsEDXK0s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jasf5-006gcF-4J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 03:11:25 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E91920758;
 Tue, 19 May 2020 03:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589857877;
 bh=fQJhv7BXMwaA0dzpsoMf8NxlxMhmUG7xRjrY2MXodxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+ynbEIxoWC9ZFUzgGEI+UEkWw4JYgHAi8bBZyNyqyAeKmCWNf0hhlHYX3lYPpSgy
 i3TWO+cmOWGoANRs1YhK8eRfs/3kf1hx7r9vvLPWjY3O/xvqClBcBWuxB0siNrneQn
 uNR70h8mSFz04av7XzCEvSTAm2XfWYahSMAtSOYk=
Date: Mon, 18 May 2020 20:11:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200519031115.GC954@sol.localdomain>
References: <20200512233251.118314-1-ebiggers@kernel.org>
 <20200512233251.118314-4-ebiggers@kernel.org>
 <20200519025355.GC2396055@mit.edu>
 <20200519030205.GB954@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519030205.GB954@sol.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jasf5-006gcF-4J
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 18, 2020 at 08:02:05PM -0700, Eric Biggers wrote:
> On Mon, May 18, 2020 at 10:53:55PM -0400, Theodore Y. Ts'o wrote:
> > On Tue, May 12, 2020 at 04:32:50PM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > v1 encryption policies are deprecated in favor of v2, and some new
> > > features (e.g. encryption+casefolding) are only being added for v2.
> > > 
> > > Therefore, the "test_dummy_encryption" mount option (which is used for
> > > encryption I/O testing with xfstests) needs to support v2 policies.
> > > 
> > > To do this, extend its syntax to be "test_dummy_encryption=v1" or
> > > "test_dummy_encryption=v2".  The existing "test_dummy_encryption" (no
> > > argument) also continues to be accepted, to specify the default setting
> > > -- currently v1, but the next patch changes it to v2.
> > > 
> > > To cleanly support both v1 and v2 while also making it easy to support
> > > specifying other encryption settings in the future (say, accepting
> > > "$contents_mode:$filenames_mode:v2"), make ext4 and f2fs maintain a
> > > pointer to the dummy fscrypt_context rather than using mount flags.
> > > 
> > > To avoid concurrency issues, don't allow test_dummy_encryption to be set
> > > or changed during a remount.  (The former restriction is new, but
> > > xfstests doesn't run into it, so no one should notice.)
> > > 
> > > Tested with 'gce-xfstests -c {ext4,f2fs}/encrypt -g auto'.  On ext4,
> > > there are two regressions, both of which are test bugs: ext4/023 and
> > > ext4/028 fail because they set an xattr and expect it to be stored
> > > inline, but the increase in size of the fscrypt_context from
> > > 24 to 40 bytes causes this xattr to be spilled into an external block.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> > 
> > Looks good, but could you do me a favor and merge in this?
> > 
> > diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
> > index 04bfaf63752c..6c9fc9e21c13 100644
> > --- a/fs/ext4/sysfs.c
> > +++ b/fs/ext4/sysfs.c
> > @@ -293,6 +293,7 @@ EXT4_ATTR_FEATURE(batched_discard);
> >  EXT4_ATTR_FEATURE(meta_bg_resize);
> >  #ifdef CONFIG_FS_ENCRYPTION
> >  EXT4_ATTR_FEATURE(encryption);
> > +EXT4_ATTR_FEATURE(test_dummy_encryption_v2);
> >  #endif
> >  #ifdef CONFIG_UNICODE
> >  EXT4_ATTR_FEATURE(casefold);
> > @@ -308,6 +309,7 @@ static struct attribute *ext4_feat_attrs[] = {
> >  	ATTR_LIST(meta_bg_resize),
> >  #ifdef CONFIG_FS_ENCRYPTION
> >  	ATTR_LIST(encryption),
> > +	ATTR_LIST(test_dummy_encryption_v2),
> >  #endif
> >  #ifdef CONFIG_UNICODE
> >  	ATTR_LIST(casefold),
> > 
> > This will make it easier to have the gce-xfstests test runner know
> > whether or not test_dummy_encryption=v1 / test_dummy_encryption=v2
> > will work, and whether test_dummy_encryption tests v1 or v2.
> > 
> 
> Thanks, I'll add that.  I assume you meant "Reviewed-by"?

Jaegeuk, do you want /sys/fs/f2fs/features/test_dummy_encryption_v2 as well, to
match what Ted wants for ext4?  It would be the following change:

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e3bbbef9b4f09e4..3162f46b3c9bfc1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -446,6 +446,7 @@ enum feat_id {
 	FEAT_SB_CHECKSUM,
 	FEAT_CASEFOLD,
 	FEAT_COMPRESSION,
+	FEAT_TEST_DUMMY_ENCRYPTION_V2,
 };
 
 static ssize_t f2fs_feature_show(struct f2fs_attr *a,
@@ -466,6 +467,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_SB_CHECKSUM:
 	case FEAT_CASEFOLD:
 	case FEAT_COMPRESSION:
+	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
 		return sprintf(buf, "supported\n");
 	}
 	return 0;
@@ -563,6 +565,7 @@ F2FS_GENERAL_RO_ATTR(avg_vblocks);
 
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
+F2FS_FEATURE_RO_ATTR(test_dummy_encryption_v2, FEAT_TEST_DUMMY_ENCRYPTION_V2);
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
@@ -647,6 +650,7 @@ ATTRIBUTE_GROUPS(f2fs);
 static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_FS_ENCRYPTION
 	ATTR_LIST(encryption),
+	ATTR_LIST(test_dummy_encryption_v2),
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(block_zoned),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
