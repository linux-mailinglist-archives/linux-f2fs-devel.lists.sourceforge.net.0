Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38AAF8D1E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 11:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mECPZ7WtJIUUkREo21+ntfd1Xu8ZSUcRci4gFAa9yGw=; b=LybjF/qjGSBBfJ3dHT/XQzWQKw
	n4WCEWNLkheuULJYqygvAooCqQ3od8fMrRqY5mQLBs5IC1FNvnoOQA3o3OrhyYRhpAavuSggKRAKD
	ZCTx2F7Ts03L5g98+uWrJ/WSHiiffipaPt3OXfNCfFqhz6O3Frf+ZzE0vtIs2xY4YbiA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXcIa-0004Fc-At;
	Fri, 04 Jul 2025 09:01:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uXcIY-0004FN-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 09:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y2Afg0ypfvKKG1YKSjkafmZZkBHvAqpnFufUyLsiu7s=; b=kHE3bTtRQM01jWgLFyyg3LdaNu
 wkF8kyLoxyORrqyGBCk5jIiI41+cKAgOdU8PSqgLKAXmXhUWyct42xCHdOLo/sWvgkTXeoDJ/b/4v
 KD90Hw9c1FHIBrnGzo00uKR9OjSFPSVl8HX+wo+fKuSBzquLYytPcQ7/6fb8aoMvNrKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y2Afg0ypfvKKG1YKSjkafmZZkBHvAqpnFufUyLsiu7s=; b=Um3F3iorMi0MXQ6Zm1VRc6jYTg
 rAykO9KcotR0sy21TJ6oT22OdUo8yCLkmSUVc3zU8FKChpO5z0+ssBzOOk5lRJzQg8SfzqE4vn/ga
 4dGLD8HC2GsVQMOZqHYT3AAiTe3cXI6zFWfH7iknKONjA/wZ8w3lOLhK7k2DrFMUBr0k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXcIY-0003jM-7P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 09:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFFF845173;
 Fri,  4 Jul 2025 09:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F17C4CEF2;
 Fri,  4 Jul 2025 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751619683;
 bh=pcXFhsJsF5hHVop2Uie9TJ3r5ke5/MrZcsdmdG6PI90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SWth88w9VKiIbf+GBcuBPQcOc6Hwh9zyQr71qDjparPp1ptSZEjb0iNmv3p9fr84F
 YqhL8670JOZgkF1AyL7Mz26ZHup6c0+Jg14eoduZmk8lsTpIuiODaoXJr5+6wUHAfz
 9r+HuGiNwLAJP1PjQpHgYCMabqGvXfTL88m/gCDC2V8vEQk9N30pZ+exhWBSz3KC9Q
 S4AUxgAvfTbDZgGk00E2Et3Ght8hDjzFjNH0gbZaM6CP5xgIMnY6pHJ+YSyoQWEQfk
 W943Nkg84GGNj75k0JuVRn2L1kn2CQhg2cnx3+hQE+GWWg8sBNa5m5CKkUWD3InsAo
 aehILMedRcJqQ==
To: linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>
Date: Fri,  4 Jul 2025 11:00:15 +0200
Message-ID: <20250704-erproben-umgefahren-a485732e97de@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
References: <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=brauner@kernel.org;
 h=from:subject:message-id; bh=pcXFhsJsF5hHVop2Uie9TJ3r5ke5/MrZcsdmdG6PI90=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSkz4id2rdw0f/jH/S4TgTGCK0OP6vgkbBCwX1SZb/CT
 Jf0sDd7OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYiwMjI8KTol5138C/TV3su
 Hq5XK607tObknMkLlJPL4td7HdCJXcHIcMb/WwtfQV2QD3ezGEui+49+4e9amvcnfDl3YBlnX6Y
 gOwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 04 Jul 2025 10:12:29 +0930,
 Qu Wenruo wrote: > Currently
 all the filesystems implementing the > super_opearations::shutdown() callback
 can not afford losing a device. > > Thus fs_bdev_mark_dea [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXcIY-0003jM-7P
Subject: Re: [f2fs-dev] (subset) [PATCH v4 1/6] fs: enhance and rename
 shutdown() callback to remove_bdev()
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
Cc: Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 jack@suse.cz, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, viro@zeniv.linux.org.uk, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 04 Jul 2025 10:12:29 +0930, Qu Wenruo wrote:
> Currently all the filesystems implementing the
> super_opearations::shutdown() callback can not afford losing a device.
> 
> Thus fs_bdev_mark_dead() will just call the shutdown() callback for the
> involved filesystem.
> 
> But it will no longer be the case, with multi-device filesystems like
> btrfs and bcachefs the filesystem can handle certain device loss without
> shutting down the whole filesystem.
> 
> [...]

Moving this into a stable branch that won't change anymore and that you
can pull into btrfs/use as base for your patches.

---

Applied to the vfs-6.17.super branch of the vfs/vfs.git tree.
Patches in the vfs-6.17.super branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.17.super

[1/6] fs: enhance and rename shutdown() callback to remove_bdev()
      https://git.kernel.org/vfs/vfs/c/165fa94de612


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
