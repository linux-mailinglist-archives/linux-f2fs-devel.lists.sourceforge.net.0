Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PmHKIcucO2p9aQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E76BCC27
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XgXylW1A;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=P6DiXxuj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="G uHX1Gg";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=juM42ubM;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/MAHphSuSudm1UKkDSrRzZ6AKWrJJtGt1eDxiY3Ry0=; b=XgXylW1AIOkq5hJJQ1pjU/a2GE
	6olBx3AUUUmlsr8acnu+8Z+PQstXWNiAxWk8uK3A2KirWRclzW1mfYwqW+KgpKiZ+5RQwfG5ajv+R
	DRgdRFBK7UCJKOiiDWW5Vpc7cztRCXpXUZ21VJRu3jE7eHH30Nrz0MmR/ePuaj7FrO1Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcJTa-0008GP-3Y;
	Wed, 24 Jun 2026 09:00:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wcJTS-0008DJ-30
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JjL6dhBnyDtQ1V+CFFTtu1ugVZc8avKE+2MHRbCx/4s=; b=P6DiXxuj24BZDUPiqQiAmsPZs8
 zPNYl437oLajEmhAtz5CwIN3gTjTgP3H1nzDLtHU+dyDLx6Rvc6s1SJ87U6E/A9xvhe7LlnlFY15e
 VtwvDCz0ua5HrkEn4EDGCv8ENf+EDbdXXDuqNVATUZN0JxFpIcVPbZRapXqqmbuv9D3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JjL6dhBnyDtQ1V+CFFTtu1ugVZc8avKE+2MHRbCx/4s=; b=G
 uHX1GguYKW2pcrpKpf5yK9P4/cxu6N9TjF07osRAefIUT72kmVZ0BG9cc/dmkTBu27tatbNt5Y4XQ
 vAGwnktiDYIyWo6taA1pG4OKFrY49bKVIhEIPjYDPDK1/brIbM3MvMDAeJXrvotQcJ1pXib2pfLIm
 gRcEPYj5o7CfEyMQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcJSX-0000qy-9n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FCBA418E4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jun 2026 08:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344F41F000E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jun 2026 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782291579;
 bh=JjL6dhBnyDtQ1V+CFFTtu1ugVZc8avKE+2MHRbCx/4s=;
 h=Subject:From:Date:To;
 b=juM42ubMkgh3lzYl5GHzibttRt1ArWV5tVlSVRZ5/L+x/5oeSFfQQDzs7BEZWUrdD
 3D/WKGBLLGXyyxWiemGBlzwQTeC2qCckE7hPfRdz4OCa/LOvzsGTnJ4WwrBaIlcvfn
 hTFsLK+YegCZrgL6UUEfypAPJO/qg/bb5roRbqP+zeLLHJ0smXKtNUw2CAhR9AFsAC
 oBejqovkG1LquaXk8PADfJiBKUj1qHim5bMZEqaV4MCaHMDnvGDF0eiSF7fUtfwH5p
 sYooKEMIqYegIJRHrgVw7fJlYDBnr9s2kEjzf/LbqR0vo8ZXhEsXYTXsm6nt2EIGfs
 q7hQn65UaO+4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 5932839EF964 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jun 2026 08:59:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178229156799.2577930.16585179862992494459.git-patchwork-summary@kernel.org>
Date: Wed, 24 Jun 2026 08:59:27 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: Exposing case folding
 behavior Submitter: Chuck Lever <cel@kernel.org> Committer: Christian Brauner
 <brauner@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=10908
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wcJSX-0000qy-9n
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_EQ_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[jaegeuk.kernel.org:query timed out];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 191E76BCC27

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: Exposing case folding behavior
  Submitter: Chuck Lever <cel@kernel.org>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1090897
  Lore link: https://lore.kernel.org/r/20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com
    Patches: [f2fs-dev,v14,01/15] fs: Move file_kattr initialization to callers
             [f2fs-dev,v14,02/15] fs: Add case sensitivity flags to file_kattr
             [f2fs-dev,v14,03/15] fat: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,04/15] exfat: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,05/15] ntfs3: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,06/15] hfs: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,07/15] hfsplus: Report case sensitivity in fileattr_get
             [f2fs-dev,v14,08/15] xfs: Report case sensitivity in fileattr_get
             [f2fs-dev,v14,09/15] cifs: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,10/15] nfs: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,11/15] vboxsf: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,12/15] isofs: Implement fileattr_get for case sensitivity
             [f2fs-dev,v14,13/15] nfsd: Report export case-folding via NFSv3 PATHCONF
             [f2fs-dev,v14,14/15] nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
             [f2fs-dev,v14,15/15] ksmbd: Report filesystem case sensitivity via FS_ATTRIBUTE_INFORMATION

Series: fs-verity support for XFS with post EOF merkle tree
  Submitter: Andrey Albershteyn <aalbersh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1098004
  Lore link: https://lore.kernel.org/r/20260520123722.405752-1-aalbersh@kernel.org
    Patches: [f2fs-dev,v10,01/22] fsverity: report validation errors through fserror to fsnotify
             [f2fs-dev,v10,04/22] fsverity: generate and store zero-block hash
             [f2fs-dev,v10,07/22] iomap: introduce IOMAP_F_FSVERITY and teach writeback to handle fsverity
             [f2fs-dev,v10,08/22] iomap: teach iomap to read files with fsverity
             [f2fs-dev,v10,09/22] iomap: introduce iomap_fsverity_write() for writing fsverity metadata

Series: [f2fs-dev,v9,01/22] fsverity: report validation errors through fserror to fsnotify
  Submitter: Andrey Albershteyn <aalbersh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1086679
  Lore link: https://lore.kernel.org/r/20260428083332.768693-2-aalbersh@kernel.org
    Patches: [f2fs-dev,v9,01/22] fsverity: report validation errors through fserror to fsnotify
             [f2fs-dev,v9,04/22] fsverity: generate and store zero-block hash
             [f2fs-dev,v9,09/22] iomap: introduce iomap_fsverity_write() for writing fsverity metadata

Patch: [f2fs-dev,GIT,PULL] f2fs update for 7.2-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1115531
  Lore link: https://lore.kernel.org/r/ajrLmn16uMPcc4Lv@google.com

Series: Subject: Exposing case folding behavior
  Submitter: Chuck Lever <cel@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1055004
  Lore link: https://lore.kernel.org/r/20260217214741.1928576-1-cel@kernel.org
    Patches: [f2fs-dev,v8,01/17] fs: Move file_kattr initialization to callers
             [f2fs-dev,v8,02/17] fs: Add case sensitivity flags to file_kattr


Total patches: 26

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
