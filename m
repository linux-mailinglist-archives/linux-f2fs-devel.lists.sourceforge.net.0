Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAMeF7Ky6Wl6hwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 07:48:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3444D525
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 07:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4EHeOtwv24AvZXWUnkrN1qe2Vdlw3ilvnlhhDFpA7g=; b=DIUoe5Dwk4PTYZ3Aqw1y1U1zfm
	5NToJEstyhwp/FW+R0NYAJ/qkxjmj/1IYaPfBTrT7myRpppHzkl4tNXLHTvvSKXwanbIiE7BEuTYE
	ZJwteYGGiLs8sLUVL1sjBVknrcaGBMJlHtpPmGGrwGd/9teNP8hYxznDh9DfN1wmwuZY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFmvF-000143-Pk;
	Thu, 23 Apr 2026 05:48:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ginger.jzllee@gmail.com>) id 1wFmvE-00013v-BW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 05:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5XIJJ+HB9/6ZH3TWKGdyh5Nzg4TBnye3t4cf8uEtxRc=; b=CtQT+OKEtTl4Ziwgr2QOCURcGa
 KFs5z2YXrBieK1YmPOoPWBs/U2uitxogTMt6gbjIX6hWrhCdLA8BXJ/ZnGgKtgCC7O2/Yr+q5mGNe
 mYLe4qNHGHekjcjEdFg5TNrmtKtO7/5xBy41tMIE/U6p1YJ36gYgjBHC62+HirkCnlic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5XIJJ+HB9/6ZH3TWKGdyh5Nzg4TBnye3t4cf8uEtxRc=; b=h
 N2ixnZyqsE2zEPAGNOLHR2l6mdkZPTEh6zuJYTHr9OUfFpJCHHGSSMDdNTp/fN28RNvWmJrETJ8P1
 WOb/kLOnvpsJE7pOI5WuIP/ggYDOU50YLz22zYUIUfvAM+hdsiJuVvMSM/Y1f4POXR4Tm6ZuvWifY
 qumdYbK2k5Dmv97Q=;
Received: from mail-yw1-f177.google.com ([209.85.128.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wFmvE-00070A-1j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 05:48:20 +0000
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-79a46260385so64466857b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Apr 2026 22:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776923294; cv=none;
 d=google.com; s=arc-20240605;
 b=MRT+RalQmyFD5LRoKP9oXWXiJns7FfUTCy8JiMLxdDuP2LDDTZtJN+rcwxLfX88xEy
 srnDvWIvr11kLkogWdgHsIX35vQSNiSgiW7ZDfYRWuXnOcw76ZE6PAoeDXq6NVUclFBr
 Vzki4jC3dfzif/DQK8NO9UuabVkSthEAeVECzFTeCOm60pwemI3038C8+4tzCJr4uitn
 9vo+VV2BOCAfwJjr1JWtheXapdq2SAa2wQO5aXnYiL0i9mM65p9Z/Puakm+HJH5Rb3ag
 U1UCbI2fWSO1VUu8uurBDJhUK8YfsEU+GTkF0bZFEBYiFbbhOS7JIb7y0hBkCsvOTIya
 XFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=5XIJJ+HB9/6ZH3TWKGdyh5Nzg4TBnye3t4cf8uEtxRc=;
 fh=Niin9j0E8Ll3UdqP2bvvWkPTrY5N0ubFRP8/l3a1kXA=;
 b=Kz2B3LhMoA8mPHrgJeeW8vzULtOa9rwUmiIZXUuwGiyvxeK9+8ZvfMX1mT6SOUpyGH
 Jm91fVjNWAsTNxRsFYyQ+75AIu0TB4sV/1zAb4Xf7BdrK8QyWKpAdLcvCqGMXqFE7gDq
 6TlrMkBBYHff0AEnvBZJlF5aXnCOlrzgskSnIcpQOK35Pk6HwhSCXdSfwXG2DySKXr2H
 cDBDyEIucJC0dsZ2fiQcF/ERRaSKtV7QlOYMr85buftQHTH97t4THz1W5sBoNx+9cPTp
 AYbKEME2itmTLyHch5T7iS3xCtyU3r+NsYtx95FZLthe6DWNeoRcMvfsYj/EOCylpX9q
 HnCw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776923294; x=1777528094; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5XIJJ+HB9/6ZH3TWKGdyh5Nzg4TBnye3t4cf8uEtxRc=;
 b=IZcgb1vE9TL3fmgxB61HVLe4XHN7qBlTH8Njj9QN+xjtxX+03LhgGj+KTo8Pn+8eaj
 ZncTjYRZ1BSFz3et7YBbW8C3h9KJgQQ6uMgfvU9TD4pNmGr3z8Oto1UO+SWqNFRx7Upv
 DblzgYfovQs34CeC/1K1t1ekNXIU9gJYQrJgR+UlNdKxst7qtp33KCABgHWGGi/keWDS
 o0jK1m/4C/Ay/mceb09VpjfKdP6jGOS2GE1rHydlSDUpnvz6TOF5lCQ5dBHCI6mEOV3m
 WMGTt/kygieQJ5zd/RauILXCtRiiubXmYRvKnUSSAUkITuq5nBNuXNKOOpSdGoUmZMm2
 l/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776923294; x=1777528094;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XIJJ+HB9/6ZH3TWKGdyh5Nzg4TBnye3t4cf8uEtxRc=;
 b=k/VbdExZBlTry3bingX3ZywXnK9eTShyDDmkiDt5URCOnmoK49smwnHBg2PGrelSix
 VCkBTxHPY08Nq4V+mJ29l/r8xLn90hNHb7IrXwWfCqr3SEk3bzIbK0F2XzGXNzbhuTp8
 ReNbFo5xeRI/dMeGrSENLbEJOfwRmiA1OgayuWfLJOqa8sVvG/Olv/Pq9pIVTicqgu5o
 lSsyBymV0cpnCFWLckiq6yo7ywS2obXKKn2ySvtnNMoqEtgEDfQoo6FT26FXJzp63kFF
 VINXy9wlcm5id4Xzy2H5EDbqvPKiynIxJh52l6alucKkKaXA3s9kJzi7HfhaFfIXD16T
 lHig==
X-Gm-Message-State: AOJu0Yzm6OB6AS+8+UUBzOPvL0e95pg5ZS+PQe7+HAkej+y/m/h2HfcT
 9k2a2nDDJ9k5Ky1Zb90BQpl0rOz7p8geHJuuzDIg43v4Hc8+jE+svcdKmb3K8yEn4R12rcJKSCg
 cD0tlLQI1wQ36xmwUW4HS6WWTtyvS2Zc=
X-Gm-Gg: AeBDiet6pG3UnDOrBZMyxJAO6ws186OS/7gMhslmigv7UBRuwu40vm/AVDmwQXtKELd
 +xobTRweFd0SXis7g1mLjL8tw9AwpDfpV6ee+sIvjz/TzUuf9UvGU1ouzrTShhRHQ+BBO1gFmCD
 no5CSzgt529iqCvjg7fqpizOINMZcXfB/tpA4SMAu+af7jU7TBhgfUNd5dGYQ5EmSoT3mVGtSaF
 KSNxCNGxu3xApymMSBi3DhdvlcpvV0LZFwipCc9AQREl31GibGi1jqj/ai9gVd+P5G2ogYNQmbc
 opQtQSMOaFFSwMKTejvb
X-Received: by 2002:a05:690c:1d:b0:7b4:3d82:bf0 with SMTP id
 00721157ae682-7b9eceb3a6dmr256373367b3.11.1776923294296; Wed, 22 Apr 2026
 22:48:14 -0700 (PDT)
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Thu, 23 Apr 2026 13:48:04 +0800
X-Gm-Features: AQROBzA2VUGijThs0lAAL0QuK8VpG3tdbcueedjLuZhGwq4V3WK5UKX7uUCBBwk
Message-ID: <CAGp+u1ZpFon+1Cw8WxEv+kr4wRE_ibPACY+kGsoUeeB-aVa78A@mail.gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Linux kernel maintainers,
 My research-based static analyzer
 found a potential atomicity bug within the 'fs/f2fs' subsystem,
 more specifically, 
 in 'fs/f2fs/segment.c'. Kernel version: long-term kernel v6.18.9 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ginger.jzllee(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.177 listed in wl.mailspike.net]
X-Headers-End: 1wFmvE-00070A-1j
Subject: [f2fs-dev] [bug report] potential order violation bug in
 'fs/f2fs/segment.c', in '__create_discard_cmd'
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gingerjzllee@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 90B3444D525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Linux kernel maintainers,

My research-based static analyzer found a potential atomicity bug
within the 'fs/f2fs' subsystem, more specifically, in
'fs/f2fs/segment.c'.

Kernel version: long-term kernel v6.18.9

Potential concurrent triggering executions:
T0:
__create_discard_cmd
     --> dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
     --> list_add_tail(&dc->list, pend_list);
     --> spin_lock_init(&dc->lock);
     --> dc->bio_ref = 0;

In T0, the freshly allocated 'struct discard_cmd *dc' is first added
to the globally visible list 'pend_list' (i.e., from
dcc->pend_list[plist_idx(len)]'.
However, its fields like 'dc->lock' and 'dc->bio_ref' are set up after
being globally visible.
This violated the expected order of setting up private local heap
variables before exposing them to the global state, causing potential
concurrency bugs with '__issue_discard_cmd()' or
'__submit_discard_cmd()' within 'fs/f2fs/segment.c'.

Please kindly check at your convenience. Thank you for your time and
consideration.

Best regards,
Ginger


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
