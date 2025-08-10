Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779FB1F961
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRkLOWN3GTIs69701MFbb83Hz7dZw45hjevN/+sdcJU=; b=i74jmV6rHGIW2/PdqfwlYKjSHS
	WsWZ+dofJ1CORHYHrv5pLrQSCzrtjlCo+UEGbtSQ1OQNq1fhYn4kCmsXBkXHE7fkQmCt8OXmkKWNh
	XWoyXdr8tnG9tgoxGX/Q5Rb/FA0bYlG2sV3LjMe41+A1PyN/nyGaS331xv9/KcTpBy9o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul1ii-0006BC-Sb;
	Sun, 10 Aug 2025 08:48:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1ul1iS-00064q-47
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=keyVjPd27UZqZ6tmwIOkfKVn0462VrAA+VIUj+rGi38=; b=I4TWNbeKFzqdIlxh69Za0P3UZg
 Mzx8Ed/zl9ZyIhWHdPKoeWTZ2XeJf/SsBphn8Jm4xLrs6Uu1t+HsSNhuQ+VuGaHV4b4xiVSJQnTb8
 1bcSQs/3+CALsJAbK64vVbwRco0+cpVwRZqcxBytDTOjH3Jhuxaspuj9+OY3HIbyF9xQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=keyVjPd27UZqZ6tmwIOkfKVn0462VrAA+VIUj+rGi38=; b=KWjEVAoaanl5Ozrni/vTjvpWzU
 wO3pM+YB2zuGECvRL4HLk7elB3OezwTLYs8EhG5Tk4YUBV4teqsajGLajvKGdd8PNjetbcVKnWycv
 FolHdvUwTJWheagdm9kzsE8g6e1wlVvsjMDa1GSag/SkLwgC4JYlAjTusOnX56AYCQBY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul1iR-00059d-KH for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 033E0A5289D;
 Sun, 10 Aug 2025 08:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CF8C4CEEB;
 Sun, 10 Aug 2025 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754815657;
 bh=q8SgtBm3Um6/IA3ICdzyzAhRe18cnxg4v20POkcefXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FtooPbxvpMTQCvH7Y/f3jq8mtZ+j/O3aDgP+3ZDwN0u32EsCmn8yc0AKE1k/H2Z1k
 PQcymiASqiWiA16/vCx1gQQcg7YHewbgB1Wc/5K7oo75w46ZkF91d1ycyvskavJO3D
 tTpZsbR+PitArv7r2tRUUUeejD0YwLa6Fn1dABbPofZOU+eDQdZQoCUATiN+hpG58A
 0xvnOYtqG67M2OJnB5cZipmABNVmRvYs5TIUnVYKQR+fkIAQjUtb7DtnWFi4aymBzu
 Iuy8JCz+4B0EdnQsu2lU/uW4tHrpSpqnCISu7mnnhxzEGd2p7NGr1cq7nEuvnDpShT
 eax2bwRzxDaDQ==
Date: Sun, 10 Aug 2025 10:47:32 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20250810-tortur-gerammt-8d9ffd00da19@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
 > This is a cleaned-up implementation of moving the i_crypt_info and >
 i_verity_info
 pointers out of 'struct inode' and into the fs-specif [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul1iR-00059d-KH
Subject: Re: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out
 of struct inode
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> This is a cleaned-up implementation of moving the i_crypt_info and
> i_verity_info pointers out of 'struct inode' and into the fs-specific
> part of the inode, as proposed previously by Christian at
> https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> 
> The high-level concept is still the same: fs/crypto/ and fs/verity/
> locate the pointer by adding an offset to the address of struct inode.
> The offset is retrieved from fscrypt_operations or fsverity_operations.
> 
> I've cleaned up a lot of the details, including:
> - Grouped changes into patches differently
> - Rewrote commit messages and comments to be clearer
> - Adjusted code formatting to be consistent with existing code
> - Removed unneeded #ifdefs
> - Improved choice and location of VFS_WARN_ON_ONCE() statements
> - Added missing kerneldoc for ubifs_inode::i_crypt_info
> - Moved field initialization to init_once functions when they exist
> - Improved ceph offset calculation and removed unneeded static_asserts
> - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
>   no longer think it's actually correct there.
> - verity_data_blocks() now keeps doing a raw dereference
> - Dropped fscrypt_set_inode_info() 
> - Renamed some functions
> - Do offset calculation using int, so we don't rely on unsigned overflow
> - And more.
> 
> For v4 and earlier, see
> https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> 
> I'd like to take this series through the fscrypt tree for 6.18.
> (fsverity normally has a separate tree, but by choosing just one tree
> for this, we'll avoid conflicts in some places.)

Woh woh. First, I had a cleaned up version ready for v6.18 so if you
plan on taking over someone's series and resend then maybe ask the
author first whether that's ok or not. I haven't seen you do that. You
just caused duplicated work for no reason.

And second general infrastructure changes that touch multiple fses and
generic fs infrastructure I very much want to go through VFS trees.
We'll simply use a shared tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
