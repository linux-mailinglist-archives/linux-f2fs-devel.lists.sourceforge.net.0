Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1CC2740D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Sep 2020 13:30:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKgUs-0005ua-2D; Tue, 22 Sep 2020 11:30:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jlayton@kernel.org>) id 1kKgUq-0005uE-Ik
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 11:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PTgk8inJBgIdl1kjf/vzKImY9EkEKaUVdnKdHjzlMQ0=; b=mPdnE3EunUcZGtPsWJZXSF/blI
 CiwJzrf/wwK4mYEkzC2YxQ4InwUoOuCKP5FFc7aHKeOtHrSiSnm0XIOsGXAUvywV/clcUW3uYO2zf
 N0RFZfa87M5/MPHkdRgkCd3dG02/Z4l41Dzs5l7/dx2BlKaqXqC3Jbhufpk/KY65UFFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PTgk8inJBgIdl1kjf/vzKImY9EkEKaUVdnKdHjzlMQ0=; b=RneLfYCMOxs5Hqd+/spzHlLqQX
 p/M+MEzP75s/PGEW93ECXGNBER3KcYe1hwlMHYsRBAzit5Ka+ebYq2bXE1Wz95zJQcuXzLeOtOik5
 IWrUaXY914Y1p4pyy0C26ds2sig7ZxpQe8RixQc9eFEum1CyYYJwTKonEvzhf0upWMXI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKgUj-0037tV-0a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 11:30:08 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAA4C23600;
 Tue, 22 Sep 2020 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600774187;
 bh=Rtabf4pcHe8DkWlrQYiZax+IoE7elEphUCXD07p8Kv8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=TPVYvWlDl1nk+c/kNwxb4OaJKxHSZNcKrEYanb7OZHJvzfNLZ0TIQ57LGZSs4g/oo
 O/3hYdyIcAupQB0Fevm3j0VJCAFLwy4mkQOJFoDvqTEz5rlRrzPMEc8mdMpmWp3m2r
 qZfC5SE8JLVtwzT0a38q9VlsacraVJ8dJUmL6c5g=
Message-ID: <da7f608e01cd8725d8da668f1c4a847b29b9de68.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
Date: Tue, 22 Sep 2020 07:29:45 -0400
In-Reply-To: <20200921223509.GB844@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200921223509.GB844@sol.localdomain>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kKgUj-0037tV-0a
Subject: Re: [f2fs-dev] [PATCH v3 00/13] fscrypt: improve file creation flow
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
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2020-09-21 at 15:35 -0700, Eric Biggers wrote:
> On Wed, Sep 16, 2020 at 09:11:23PM -0700, Eric Biggers wrote:
> > Hello,
> > 
> > This series reworks the implementation of creating new encrypted files
> > by introducing new helper functions that allow filesystems to set up the
> > inodes' keys earlier, prior to taking too many filesystem locks.
> > 
> > This fixes deadlocks that are possible during memory reclaim because
> > fscrypt_get_encryption_info() isn't GFP_NOFS-safe, yet it's called
> > during an ext4 transaction or under f2fs_lock_op().  It also fixes a
> > similar deadlock where f2fs can try to recursively lock a page when the
> > test_dummy_encryption mount option is in use.
> > 
> > It also solves an ordering problem that the ceph support for fscrypt
> > will have.  For more details about this ordering problem, see the
> > discussion on Jeff Layton's RFC patchsets for ceph fscrypt support
> > (v1: https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u
> >  v2: https://lkml.kernel.org/linux-fscrypt/20200904160537.76663-1-jlayton@kernel.org/T/#u
> >  v3: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-1-jlayton@kernel.org/T/#u)
> > Note that v3 of the ceph patchset is based on v2 of this patchset.
> > 
> > Patch 1 adds the above-mentioned new helper functions.  Patches 2-5
> > convert ext4, f2fs, and ubifs to use them, and patches 6-9 clean up a
> > few things afterwards.
> > 
> > Finally, patches 10-13 change the implementation of
> > test_dummy_encryption to no longer set up an encryption key for
> > unencrypted directories, which was confusing and was causing problems.
> > 
> > This patchset applies to the master branch of
> > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
> > It can also be retrieved from tag "fscrypt-file-creation-v3" of
> > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.
> > 
> > I'm looking to apply this for 5.10; reviews are greatly appreciated!
> > 
> > Changed v2 => v3:
> >   - Added patch that changes fscrypt_set_test_dummy_encryption() to take
> >     a 'const char *'.  (Needed by ceph.)
> >   - Fixed bug where fscrypt_prepare_new_inode() succeeded even if the
> >     new inode's key couldn't be set up.
> >   - Fixed bug where fscrypt_prepare_new_inode() wouldn't derive the
> >     dirhash key for new casefolded directories.
> >   - Made warning messages account for i_ino possibly being 0 now.
> > 
> > Changed v1 => v2:
> >   - Added mention of another deadlock this fixes.
> >   - Added patches to improve the test_dummy_encryption implementation.
> >   - Dropped an ext4 cleanup patch that can be done separately later.
> >   - Lots of small cleanups, and a couple small fixes.
> > 
> > Eric Biggers (13):
> >   fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   ext4: factor out ext4_xattr_credits_for_new_inode()
> >   ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   fscrypt: adjust logging for in-creation inodes
> >   fscrypt: remove fscrypt_inherit_context()
> >   fscrypt: require that fscrypt_encrypt_symlink() already has key
> >   fscrypt: stop pretending that key setup is nofs-safe
> >   fscrypt: make "#define fscrypt_policy" user-only
> >   fscrypt: move fscrypt_prepare_symlink() out-of-line
> >   fscrypt: handle test_dummy_encryption in more logical way
> >   fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char
> >     *'
> 
> All applied to fscrypt.git#master for 5.10.
> 
> I'd still really appreciate more reviews and acks, though.
> 

You can add this to all of the fscrypt: patches. I've tested this under
the ceph patchset and it seems to do the right thing:

Acked-by: Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
