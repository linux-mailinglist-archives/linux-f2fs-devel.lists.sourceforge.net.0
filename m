Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOHGNH9elGnODAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 13:26:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311314BEC6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 13:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJN0Am7pEpT8j9Qr2oTxMoueqSqdGln3izYrSZ1NEkM=; b=AWCmZPe3ElQAO5JTDOMT0AT+Qu
	tAMQW+jK+z4KOwalAO0FLzo8cK43pchnjGs2gkniFZYpZIU7p/MNgEG3k0II/jbn2BlURKS0FaXt5
	LLL2gBP3BZm250aglH7L/kys4EHdyDuypuwGeozSAXDQlivc/gtGljKqcSgY60Nt6BVs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsK9s-0000zM-0i;
	Tue, 17 Feb 2026 12:26:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vsK9q-0000z9-LL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 12:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/aZRp3q9pts8iU89ILS8QiHRctxsx8h6RbQ0tqoKtRg=; b=KFkQHaLEy7FvYlcvxEjc1vLrEW
 US1ulSDzxhHYRCjIvbszGTjVAfJ1Ky004AAHkgG1twkXaXEMlJCAve8LYTXQpTvGv6SvfhBXtd5N1
 3qgAyvZjfpGTJgaq1ljpHhrGChYL1bt/p6DfwpvM+ZKj82QsBLnnNJs98l17P2R5L4dQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/aZRp3q9pts8iU89ILS8QiHRctxsx8h6RbQ0tqoKtRg=; b=lcvkPwJJ9cY32NNwbKUuYUDS3Y
 FniypDT7o6K3RD16ei3IoZEYx2UFu1OSDY9JID5KdOxPDrhXWwyfXl2GsM3yeZ1k9xSnxPievUcBZ
 NMEiKS5Op2DZdmp6pdDQdmnI1EC7Ww4E/xtDbxRIJTpedPH2T5/M4y3NC+tuWQ5sCIGo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsK9q-0002X3-WA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 12:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A08BD436EC;
 Tue, 17 Feb 2026 12:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA2BC4CEF7;
 Tue, 17 Feb 2026 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771331176;
 bh=T0L8Hm85DweBO5FE6HwA1Kx5ApHoeds8vAJGxZQRbWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ct8kGGic4pTwYeSCcRCaAAts9KnujAI12ci5w9gsJRqn0RYFQVdsfsWvHSlMwdCAf
 NwJ0JlISR/R4ZFVuJfcYKj/LcKcBtGxi/hz76FQ8HXt9O+rI7AZWQVrapT9+YMoj20
 AVv7xJYn45uidLdiJ/XqJf2ul7NLQAzp5ZUsOZySDUQnMbQZwjUeMp7BNKhrY+MvoQ
 bge/3Sje8r1ZsHKsfbA5kWZb7SYvwrXw7fJLEIn+dWncoCvkE2LG0iNQIoq9JFAUKG
 y27cXr0K7vM0ShgTZ31Su5h1fjT4/PFQ8og0GcPyDvNru139zhsWxLD1MlqwSQo8dk
 lZlLHSBYNxWPQ==
To: Kundan Kumar <kundan.kumar@samsung.com>
Date: Tue, 17 Feb 2026 13:26:02 +0100
Message-ID: <20260217-rosig-hausdach-fcba09a3c371@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213054634.79785-1-kundan.kumar@samsung.com>
References: <20260213054634.79785-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=brauner@kernel.org;
 h=from:subject:message-id; bh=T0L8Hm85DweBO5FE6HwA1Kx5ApHoeds8vAJGxZQRbWI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWROiUtcnj+rL/CFuo7v7iTuU9YF5eyPNp61t5kW7W4bn
 KqmJdrdUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMJGl/YwMyw+LNjSq6u999WH1
 WSffYF0Wlsal5x+nXTp18hzj7N+PTzL8T/gVKhU0lZ3t2yz1ZOUrEhujnnX/bnliceJRWMgylY+
 eHAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 13 Feb 2026 11:16:30 +0530, Kundan Kumar wrote: >
 The series introduces writeback helper APIs and converts f2fs, gfs2 > and
 nfs to stop accessing writeback internals directly. > > As suggested [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vsK9q-0002X3-WA
Subject: Re: [f2fs-dev] [PATCH v2 0/4] Avoid filesystem references to
 writeback internals
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
Cc: Christian Brauner <brauner@kernel.org>, jack@suse.cz, agruenba@redhat.com,
 gost.dev@samsung.com, anuj20.g@samsung.com, jlayton@kernel.org,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, gfs2@lists.linux.dev,
 djwong@kernel.org, viro@zeniv.linux.org.uk, anna@kernel.org,
 vishak.g@samsung.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@lst.de, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kundan.kumar@samsung.com,m:brauner@kernel.org,m:jack@suse.cz,m:agruenba@redhat.com,m:gost.dev@samsung.com,m:anuj20.g@samsung.com,m:jlayton@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gfs2@lists.linux.dev,m:djwong@kernel.org,m:viro@zeniv.linux.org.uk,m:anna@kernel.org,m:vishak.g@samsung.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@lst.de,m:trondmy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[brauner@kernel.org]
X-Rspamd-Queue-Id: 2311314BEC6
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 11:16:30 +0530, Kundan Kumar wrote:
> The series introduces writeback helper APIs and converts f2fs, gfs2
> and nfs to stop accessing writeback internals directly.
> 
> As suggested by Christoph [1], filesystem code that directly accesses
> writeback internals is split out:
> [1] https://lore.kernel.org/all/20251015072912.GA11294@lst.de/
> 
> [...]

Applied to the master branch of the vfs/vfs.git tree.
Patches in the master branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: master

[1/4] writeback: prep helpers for dirty-limit and writeback accounting
      https://git.kernel.org/vfs/vfs/c/a235d3bcd28b
[2/4] f2fs: stop using writeback internals for dirty_exceeded checks
      https://git.kernel.org/vfs/vfs/c/07043a6ebeb2
[3/4] gfs2: stop using writeback internals for dirty_exceeded check
      https://git.kernel.org/vfs/vfs/c/8cab8dc0e141
[4/4] nfs: stop using writeback internals for WB_WRITEBACK accounting
      https://git.kernel.org/vfs/vfs/c/fd15b9c6ec8a


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
