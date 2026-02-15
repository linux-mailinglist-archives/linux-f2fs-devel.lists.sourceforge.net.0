Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMsrBJtLkWnThAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 05:29:15 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DDF13DFFD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 05:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9UO1Dkrvdt3YtUNE3EAk9+VeMlJtTMgoOIBh6yX5VLI=; b=jcbrm9Q6Mo5/fs5skLHT2NZJGe
	iyf9ZdyES1MM8HDRtxGq+tI6htDnfpGqw7qzB+oQQPF166YWErYmbjpiPQqUro7VWnVm0UuDu64td
	ep6gVhp4wawceUY/v3ZadFuHifbogWLRY74to4bHnxlBtqS2161DcdxtwDlH+uFeO90Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrTks-00014x-DV;
	Sun, 15 Feb 2026 04:29:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrTkq-00014r-OL
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 04:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNcPxGjvLK6eIEfYGvhEJpUCmS16IwklrRFeQQtVlMQ=; b=LTJxwi7bGH6jJg+u00jzZQOxxc
 8zSiTRJxBMIjUAeForbSejkhSjiBhj/EUb1K/qdp2PLVdVkzh6clVIBXpduEHYMT1c03emb322C6x
 JrCu+7uFEx2BM+TpTDpnBPjJ8ozbDX8gxbrGCOwezE4qTKrxduzJDve8iXI6znymKRhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FNcPxGjvLK6eIEfYGvhEJpUCmS16IwklrRFeQQtVlMQ=; b=S
 Y8dtg0HBX8ngSrR/CUu6UV41zd7Lyru8vCoZ7SmVgkSMa/DOkRtElX3wp6gEuqI5k/wcYyEIQloX0
 vD8OQ4DF7l1TAeJ+H4zRSbotejuPKm5YEk2Ts5HX/5elPrXOjlnrwY7Q6LQ+AaslCIod4XyidFEeI
 KpcEVc0FpdeKtPfQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrTkq-0008Ex-DT for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 04:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ED23B4372E;
 Sun, 15 Feb 2026 04:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81575C4CEF7;
 Sun, 15 Feb 2026 04:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771129742;
 bh=JbWq7wgnL2qN9z7FEVzvPfVqM+jeBcalhVpTviJeWYo=;
 h=From:To:Cc:Subject:Date:From;
 b=b/E8BNT+nlIBwPTgmspja+zoq74WJ8XpFw1QR0S7AGNQNHztTIVz3CesCzlUAJQBA
 GrThV5g5QELcvzt9dmWa4EpxzDFNKu4cLljjL7W+hfqbomJ7pLRjkY1ah0Hs6eiGb8
 vY1UHBtX/ZhhfaH/AdroHEFa834dGk6hzvwo+nugOm02RH8szSU4CVsDZ5s16RtyXL
 Q/rEYSO3TrbFn5g7Z+ChAw31OYXMG3fetxpXEsq8cxzgSeF7GlM/FOHrvvQo7ODXdY
 oxwYOX5TPvX9VWh6JfxSwtE9GvVqZ9XRD9sgNr75loFfbyb+mFQ7op+sK7pOvYQqEe
 gh6lu5Oz/B9Bg==
To: fsverity@lists.linux.dev
Date: Sat, 14 Feb 2026 20:28:04 -0800
Message-ID: <20260215042806.13348-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series removes the non-large-folio-aware function
 fsverity_verify_page(), 
 which is no longer needed. Changed in v3: - Additional scope creep: verify
 the entire folio, switched to several more folio functions, and stop clearing
 PG_uptodate 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
X-Headers-End: 1vrTkq-0008Ex-DT
Subject: [f2fs-dev] [PATCH v3 0/2] fsverity: remove fsverity_verify_page()
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: B7DDF13DFFD
X-Rspamd-Action: no action

This series removes the non-large-folio-aware function
fsverity_verify_page(), which is no longer needed.

Changed in v3:
    - Additional scope creep: verify the entire folio, switched to
      several more folio functions, and stop clearing PG_uptodate

Changed in v2:
    - Made one specific part of f2fs_verify_cluster() large-folio-aware

Eric Biggers (2):
  f2fs: make f2fs_verify_cluster() partially large-folio-aware
  fsverity: remove fsverity_verify_page()

 fs/f2fs/compress.c       | 11 +++++------
 fs/verity/verify.c       |  4 ++--
 include/linux/fsverity.h |  6 ------
 3 files changed, 7 insertions(+), 14 deletions(-)


base-commit: 64275e9fda3702bfb5ab3b95f7c2b9b414667164
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
