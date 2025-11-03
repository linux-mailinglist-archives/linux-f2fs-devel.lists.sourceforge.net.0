Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B8C29CEA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 02:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-Id:In-Reply-To:Date:From:To:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sq4elCTtCG1xF9f92Rdgz42n1d5k4WZh1kAIqoMoXl0=; b=b/wk5TVOco5k7M8Xr3pbtIEoNz
	/OcGr9fHk6x/XhTerNSeX6Ljm+aiJI12ipXRQ/2AVEGboj3iF1oOS2latSBSqkFT+Xooz92KzDYVk
	ww5Z5bzAnDa2CoWltAAnka75kq1OYovpmtLsMXDix7nmaxlucK5pg1Wo4oQeaAqt5ZBE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFjgx-0007Hd-H4;
	Mon, 03 Nov 2025 01:49:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1vFjgv-0007HV-AO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:In-Reply-To:Date:From:Cc:To:Subject:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=818PaUGUBLk3ZcROrqVnDDvy+icOHZOEUYmGeQN9ScA=; b=Jl4OQlBMrGtb+tgRe9EyPAvjLo
 3SeEk2o1SqNm0gnbusdFu+pMqLfwBdgjoq42sPvhDLPLZfn6MVT2mJL8YT6YgR4D65yDBCYqZXwnl
 yMV09NEQhBbdMR4kFbhKF6JkKL0jW9VD8ncVNZwDeYK33yl6kMEkY9vLEv0CDuiQ0A+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=818PaUGUBLk3ZcROrqVnDDvy+icOHZOEUYmGeQN9ScA=; b=L4aG4YkHf05lhm7FsWGaAbJn6r
 I304pwzutsn6OVz98TcKW8+Wb4TWAnrvJbl7Wyp8clbgsTKqLbWJDUhtGJDOAelH+Tmwv647L143D
 nQB9FE0bcJG1qtnXqcC5w7ChvqKE4RWk7M4SFxqiceWyykJLgOoW2su0LYVc5FMtBIdU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFjgu-0007LR-K0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DAFED60284;
 Mon,  3 Nov 2025 01:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455F5C4CEFB;
 Mon,  3 Nov 2025 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762134533;
 bh=VzvbnXysMs+hPXBAqPduVuWyElJXSDfW/ZKbFExsF/g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=yReFW9gBO54JeNjTBde3SV80321WrjASHp+In1jbqSzNCIejQv34o5HtFBhHUHLKw
 txjxZxFL2pxKLl9yhR/1uOoAkxhuMTtCxJXkhfdTVXezqntOpDmEX9IvSLZx2n0LJi
 DDdTSNQXbpb2OU8u2dJH79GPULbkFncty5NDovow=
To: adilger.kernel@dilger.ca, akpm@linux-foundation.org, anna@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, chao@kernel.org, djwong@kernel.org,
 dlemoal@kernel.org, gregkh@linuxfoundation.org, hare@suse.de,
 hch@infradead.org, idryomov@gmail.com, jaegeuk@kernel.org, jlayton@kernel.org,
 konishi.ryusuke@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, mcgrof@kernel.org, mngyadam@amazon.de,
 nagy@khwaternagy.com, trond.myklebust@hammerspace.com, tytso@mit.edu,
 viro@zeniv.linux.org.uk, willy@infradead.org, xiubli@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Nov 2025 10:46:56 +0900
In-Reply-To: <20251021070353.96705-7-mngyadam@amazon.de
Message-Id: <20251103014853.455F5C4CEFB@smtp.kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 20230827214518.GU3390869@ZenIV> Message-ID:
 <2025110356-extending-goal-0e9a@gregkh>
 MIME-Version: 1.0 Content-Type: text/plain;
 charset=ANSI_X3.4-1968 Content-Transfer-Encoding:
 8bit X-stable: commit [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1vFjgu-0007LR-K0
Subject: [f2fs-dev] Patch "direct_write_fallback(): on error revert the
 ->ki_pos update from buffered write" has been added to the 6.1-stable tree
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
Cc: stable-commits@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

20230827214518.GU3390869@ZenIV>
Message-ID: <2025110356-extending-goal-0e9a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    direct_write_fallback(): on error revert the ->ki_pos update from buffered write

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     direct_write_fallback-on-error-revert-the-ki_pos-update-from-buffered-write.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-188300-greg=kroah.com@vger.kernel.org Tue Oct 21 16:13:26 2025
From: Mahmoud Adam <mngyadam@amazon.de>
Date: Tue, 21 Oct 2025 09:03:40 +0200
Subject: direct_write_fallback(): on error revert the ->ki_pos update from buffered write
To: <stable@vger.kernel.org>
Cc: <gregkh@linuxfoundation.org>, <nagy@khwaternagy.com>, Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jeff Layton <jlayton@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Christoph Hellwig <hch@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, "Ryusuke Konishi" <konishi.ryusuke@gmail.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "Hannes Reinecke" <hare@suse.de>, Damien Le Moal <dlemoal@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>, <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <ceph-devel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>, <linux-f2fs-devel@lists.sourcefo
 rge.net>, <linux-xfs@vger.kernel.org>, <linux-nfs@vger.kernel.org>, <linux-nilfs@vger.kernel.org>, <linux-mm@kvack.org>
Message-ID: <20251021070353.96705-7-mngyadam@amazon.de>

From: Al Viro <viro@zeniv.linux.org.uk>

commit 8287474aa5ffb41df52552c4ae4748e791d2faf2 upstream.

If we fail filemap_write_and_wait_range() on the range the buffered write went
into, we only report the "number of bytes which we direct-written", to quote
the comment in there.  Which is fine, but buffered write has already advanced
iocb->ki_pos, so we need to roll that back.  Otherwise we end up with e.g.
write(2) advancing position by more than the amount it reports having written.

Fixes: 182c25e9c157 "filemap: update ki_pos in generic_perform_write"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Message-Id: <20230827214518.GU3390869@ZenIV>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/libfs.c |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1615,6 +1615,7 @@ ssize_t direct_write_fallback(struct kio
 		 * We don't know how much we wrote, so just return the number of
 		 * bytes which were direct-written
 		 */
+		iocb->ki_pos -= buffered_written;
 		if (direct_written)
 			return direct_written;
 		return err;


Patches currently in stable-queue which might be from mngyadam@amazon.de are

queue-6.1/block-fix-race-between-set_blocksize-and-read-paths.patch
queue-6.1/filemap-add-a-kiocb_invalidate_pages-helper.patch
queue-6.1/fs-factor-out-a-direct_write_fallback-helper.patch
queue-6.1/direct_write_fallback-on-error-revert-the-ki_pos-update-from-buffered-write.patch
queue-6.1/filemap-update-ki_pos-in-generic_perform_write.patch
queue-6.1/filemap-add-a-kiocb_invalidate_post_direct_write-helper.patch
queue-6.1/nilfs2-fix-deadlock-warnings-caused-by-lock-dependency-in-init_nilfs.patch
queue-6.1/block-open-code-__generic_file_write_iter-for-blkdev-writes.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
