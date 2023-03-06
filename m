Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAE26AB9B3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Mar 2023 10:24:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZ74X-0002W5-6H;
	Mon, 06 Mar 2023 09:23:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pZ74U-0002Vx-Ey
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 09:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gbdx315cFHrsdQggRnkTWaeLdbMnmMcAVCNSr/2EXSc=; b=K6TJBD66lziDeE59LdDIa9xnkU
 mM3bQBfxPap3CSBADYp1jq+aI3uCzSR9mXFLRVfjf6aZhXUARERwxZ5w7inJi69WZ495LmOHE6KRJ
 /0CJ3+Le5Wsj8TzdoklRn4os7lNWOSHV+UahcfYp0Te02PWQfLOQlzE0S9mPCZXwydJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gbdx315cFHrsdQggRnkTWaeLdbMnmMcAVCNSr/2EXSc=; b=ivUBvZgfM3vkjpVuqeIeKN2g72
 LNKHKGWTH+x1EiL05hc/P1GE9i9gTUc5U1M3gwPCFmjfNFxLDx/mIGpYrcEVGGVIJkyP+qh6UlUlB
 plIK642kfBSaVJHM+P1Gvlh+VUEgREbIXanZm2xcFsjVafZf8SNonUJuV6bLGT19W+Ws=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZ74Q-0006W4-ME for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 09:23:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14A8360B2D;
 Mon,  6 Mar 2023 09:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905C7C433EF;
 Mon,  6 Mar 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678094625;
 bh=YuHiNibTfvsVI3IB9f2dBIPvtAF+oVsFjShxdpWt8vI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vRHqvzLb1zE9mcjQ1jp4FZpy4X8k8BOCAlO9Bd5FU1F4TVtHEQxIzWeAF7S818xQ+
 7xK3kfsNq0N4FRkmFjgxeb0F6ohOwO36ABYH1YAeso+eRkf84EFU0ogvHt4F1UJ1RJ
 oQemTFv/ifce2YxmokP97eoLfW9/UsnnpgZxsZeJQcMQA/7ILKaFJXh9YrPt7cRamg
 RYtyJOTKXDNXB8Tey1paVCbZneSuXCyW4nM76R0EHO4qdYqbr8CIzaLd4NYRGY4Jv8
 yzWzxlwfCzfkqcpdRm8guCNMHC0sEE+P+I82LhGfpNNbQlZBEoP8fpH3vG+O9o9ih1
 nbwR4a4OxfI6A==
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Christian Brauner <brauner@kernel.org>
Date: Mon,  6 Mar 2023 10:23:26 +0100
Message-Id: <167809442083.601764.7315016407199154883.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098; i=brauner@kernel.org;
 h=from:subject:message-id; bh=6frdtzvyOBNLoWw4RvF5CPVqSoJpiwQ7PJrxxeWRt78=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSwbmQwlN8kdf9RF1PvK6H2638aD35gZ2WS5V7SlrHx1a6k
 lP/zO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZSN4nhv/tGP83DZ7cU/t0z7Qyb+v
 13JVdvP12bIhN1RohDPt/PgIHhr8j29aLnKn8d6Lkdl8x5d16OtfgjxcXyB3axNO7KuBFczQ4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Christian Brauner (Microsoft) <brauner@kernel.org> On
 Wed, 01 Feb 2023 14:14:51 +0100, Christian Brauner wrote: > Hey everyone,
 > > After we finished the introduction of the new posix acl api last cycle
 > we still left the generic POSIX ACL xattr hand [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZ74Q-0006W4-ME
Subject: Re: [f2fs-dev] [PATCH v3 00/10] acl: drop posix acl handlers from
 xattr handlers
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
Cc: linux-unionfs@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christian Brauner (Microsoft) <brauner@kernel.org>


On Wed, 01 Feb 2023 14:14:51 +0100, Christian Brauner wrote:
> Hey everyone,
> 
> After we finished the introduction of the new posix acl api last cycle
> we still left the generic POSIX ACL xattr handlers around in the
> filesystems xattr handlers for two reasons:
> 
> (1) Because a few filesystems rely on the ->list() method of the generic
>     POSIX ACL xattr handlers in their ->listxattr() inode operation.
> (2) POSIX ACLs are only available if IOP_XATTR is raised. The IOP_XATTR
>     flag is raised in inode_init_always() based on whether the
>     sb->s_xattr pointer is non-NULL. IOW, the registered xattr handlers
>     of the filesystem are used to raise IOP_XATTR.
>     If we were to remove the generic POSIX ACL xattr handlers from all
>     filesystems we would risk regressing filesystems that only implement
>     POSIX ACL support and no other xattrs (nfs3 comes to mind).
> 
> [...]

With v6.3-rc1 out, I've applied this now. Please keep an eye out for any
regressions as this has been a delicate undertaking: 

[01/10] xattr: simplify listxattr helpers
        commit: f2620f166e2a4db08f016b7b30b904ab28c265e4
[02/10] xattr: add listxattr helper
        commit: 2db8a948046cab3a2f707561592906a3d096972f
[03/10] xattr: remove unused argument
        commit: 831be973aa21d1cf8948bf4b1d4e73e6d5d028c0
[04/10] fs: drop unused posix acl handlers
        commit: 0c95c025a02e477b2d112350e1c78bb0cc994c51
[05/10] fs: simplify ->listxattr() implementation
        commit: a5488f29835c0eb5561b46e71c23f6c39aab6c83
[06/10] reiserfs: rework ->listxattr() implementation
        commit: 387b96a5891c075986afbf13e84cba357710068e
[07/10] fs: rename generic posix acl handlers
        commit: d549b741740e63e87e661754e2d1b336fdc51d50
[08/10] reiserfs: rework priv inode handling
        commit: d9f892b9bdc22b12bc960837a09f014d5a324975
[09/10] ovl: check for ->listxattr() support
        commit: a1fbb607340d49f208e90cc0d7bdfff2141cce8d
[10/10] acl: don't depend on IOP_XATTR
        commit: e499214ce3ef50c50522719e753a1ffc928c2ec1

Christian


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
