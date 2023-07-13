Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECA752D60
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 01:01:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qK5Ji-0005Pu-03;
	Thu, 13 Jul 2023 23:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qK5Jg-0005Pi-1Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6nWojr0hKqa4JaCj2j3XdG2IwZm8djxTYWn9rXHaZSQ=; b=VzIRSTRDk0vGfPHaVsvTO8o0Ez
 XwsCHhKTi4ruWJzomv2rRQQFqrrwNb1zbPDQNfhPfrz+wguyErj3YewId21ILIDDbSnUznN0FuHzp
 ntNI5CfmKNsueAo+jV0JVtqYymF7mvJQf1fmGoV3YvfyF447PgHHKU5It1uRklGdomUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6nWojr0hKqa4JaCj2j3XdG2IwZm8djxTYWn9rXHaZSQ=; b=OuhTFccMukMpXRoVgaeFlkIbFz
 bmbLbuBIrEtdcx+EGqPA5S0QRLwa/6cJknHu4UUjaat9UziOO+tmSFh/fdhZsAigUCjC58RxFZegg
 1KXOvsoK5PqsWj0XMOkQzh27wuHmOJBllGZSF6YkA1Ro8VMbkKQ5LJzJ0Ys0wcTl+uRQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qK5Jc-006wFr-Hp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00B2F61BBC;
 Thu, 13 Jul 2023 23:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF0AC433AB;
 Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689289294;
 bh=1/8G5JaqUI6KuuI2rdJCgZt0gS2ge3CDkWe83TSi7uM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hh00jwFLXVTfcKcYi6RPk6teBq7zejtWeTElcr3hLDz8IAh3S2IemMNuHXvNi3H4F
 QeScQzWiLdKG7tjJSKUXq0nR4EDtj340vqrwNrAGN9Ia5Apqw1huo7Ebzqqr+YuBHl
 S8vH6aKqZUS7hfoeQEutNX1WiQBlgdv6b6HX5VFk8w3yzBCsNmYk/OuKkH4+kmf6Xs
 IYNGYH5akbWDjFEM9PyjTvjKeVnl1B1Cl+gOPyof1qwofcutPAzvLpM0Zt3wUBMvdk
 wMl3V4hvpXSC8ipgZ4JRx+E2h8IU4wBaWS/eUE+Wwxz7Pdirtue9IXVzOudQEM4w2F
 cFAbu66hjm5kA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:53 -0400
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-4-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=769; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=1/8G5JaqUI6KuuI2rdJCgZt0gS2ge3CDkWe83TSi7uM=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIu7118tb5CNCK7sZ1VFW0yB4BVg1dD3GIAv
 39qas2sg2GJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 FUn6D/49/foLE14L6mU0xG1UWjybA4xy86vpS7roooMdiLD221RNkxIE52QBUyp5CX2APfX200C
 xgbwOJEpcptUud3PcBPoF8COlI/ERe5e9OpVHtCre8aWzg7pBf8pyMnE+xoIlAU6CcTJFa9NChV
 Olh6k+5lVwTnIXRD08nJ08naXSWCIsW8EAkrCywfB0ucIPaAdk5yfs6ZWKvzIJMOzvf08q/tyH9
 IPHUxUX0sNKpgXmXfCVLjFp1wKn7r8FJxarJeURYrLr5rWYLdmmuZ3E/WSTwdKR9okSva8BrC+8
 tkEb9EnYwIQbXojiol0Tl6DrLrvHnxRVaDPNi3FrTXczN8j1sYa8/j8LsuuDJUAGBKU/GsZoV6Z
 k8IiUfrDxYkoLOcyjqRFCQVEVVuF/LdfPx20g0wWhX76uRq9NHs1ExBBUfZaYnRhSrGmyGs9DU0
 XElBc5CesLSUUltqLb6O8VK6s1T89MT30rnP5PaV+5o2tpoJN2Dh5OP3DRv6N0IaV51inxOzm+1
 bQZO0+M4M9zfgjIsLAEUgrLh1kmvhU8dp1bTqcY+n6Xy39Cw4o2bXh+v+RGZBC/3Kum9DwFRvus
 MJ1kz5NoZfCBO7DrdUL+sgTN6tbKn57fiTUf2f+6Sk0T5YVQSiZB21hj7z5csvZrdxGKTu7jyCs
 h/2N1SUvw9AsY0w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Enable multigrain timestamps, which should ensure that there
 is an apparent change to the timestamp whenever it has been written after
 being actively observed via getattr. tmpfs only requires the FS_MGTIME flag.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qK5Jc-006wFr-Hp
Subject: [f2fs-dev] [PATCH v5 4/8] tmpfs: add support for multigrain
 timestamps
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
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

tmpfs only requires the FS_MGTIME flag.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 654d9a585820..b6019c905058 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4264,7 +4264,7 @@ static struct file_system_type shmem_fs_type = {
 #endif
 	.kill_sb	= kill_litter_super,
 #ifdef CONFIG_SHMEM
-	.fs_flags	= FS_USERNS_MOUNT | FS_ALLOW_IDMAP,
+	.fs_flags	= FS_USERNS_MOUNT | FS_ALLOW_IDMAP | FS_MGTIME,
 #else
 	.fs_flags	= FS_USERNS_MOUNT,
 #endif

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
