Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9VbqM4xTMWpugwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 15:45:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30F69010B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 15:45:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=dQOiv446;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=j0rbem3Q;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=asYaDA1F;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=CJBhnNNs;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KanrGvve5+Eg81gyNXStjyd5ZSnOznh+Cu56b0kIZAs=; b=dQOiv4460jzcpuLi6ayt88Hw9L
	5lTjVc2LZnOgHUl0aRcxC8T5Y0FYxICRGV64Su2r36WH5/FI5lLQGE0kgWJJ2pPCVdGek4ctbp78j
	BqhHKw2xu1YMQeZPpAIAQf09Tzrs79CM86psCdfkWQ1leAmkqJ2RQtfXc75Q88IT3kQk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZU6f-0000po-UT;
	Tue, 16 Jun 2026 13:45:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZU6e-0000pf-EG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 13:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ERxAhpPnFOTVAXWEfLWOW8cVYW26/7JxRZ3HCmemuZU=; b=j0rbem3Q6UglVKd5TwLk2ijgKJ
 CwWx52rFNiXUAKePVmQERwMJAS1xoxlIn7zNvyISV12eAur6oqlkFVZonY4rzRlhaMi3jbJeiLi/O
 AY6h/d5VUMm2/hs+g5LLYjK77/fOvOODi97fz+3rLJWJwUocrcQydEsol/bPeh2fPwcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ERxAhpPnFOTVAXWEfLWOW8cVYW26/7JxRZ3HCmemuZU=; b=asYaDA1Fr2gFdUHyum+IHjKr9K
 8NWqVZA+D53m67YXhV3QLXG/SSP21Q9vWdC9+nAhx8dRVkSS+LUxrccoKZiDjk8j+5S+jzQh4wZKJ
 jBqNEZBnVywo2tDNQMWs+2en1mrsgcOrUk/ahujt8SQ0qGhrYTZSMOctNm+/YfD6ATb4=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZU6d-0001Zw-AM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 13:45:32 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5aa5edf347eso3044536e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 06:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781617520; cv=none;
 d=google.com; s=arc-20240605;
 b=L+3tEfO4bnPN7eBbwQWLKepqpPO+rnVD2s/JwPJ6xwdBU/XAYxWc3bb3e2ijvBTeib
 +uJ/L43L7LsswYR5seRBHFOBq6i5hP06nPzjy9kN09CSjP4xGfY5BAi9AGfh418bCWkF
 v6c8odjnjMQ2iI2Uy7BTxW/FZIrO5AMoVzHFHwbv/pPXR8Hg6hlAsSriuCwyQT0rkGpr
 ldJAV8fY8WdWYKgmxlJPLwU0CCSXBf00Nj7+SYw+Had5N8Qf/cEQaLlYPw2qz6NwfiRA
 Dsiv1yeoJnD9ZI+BGmhQFcOzEKIDG+K5JvZOrzbbnbTQwZatgAsnHMTx1OkGWDgjoY9F
 4m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ERxAhpPnFOTVAXWEfLWOW8cVYW26/7JxRZ3HCmemuZU=;
 fh=zOL3khk0CaWKW3RC/N9R3Jw+9ETUsGRtAOnnJVd7gPU=;
 b=BD/ED61Pex9teKeNy66L+VMo8+7l79lCx5r/zJrqOvhldVTo/U2FpzGgBoSgroKSSv
 Gb/Uhw2s794P3YrkuhiS4bMS91OfGmyPUenT0sUaMsE5twMSNYNm+tlYOc7Ud0k9Y2A6
 WOl1HMj/4V0WWZRdpqTbJSPH0ykTVLlPgg0Q9aO4qC5eRKLFT5fPeQPzMTbqSN59mvo5
 XjeDHMMI1ghvoKzgBQSsK5UUU85Nm0q7CrCbXsioOvi/iuBuOIpZa/e7uGGlymtDZOsg
 NEiyDKjF4Hw9GBA1oZR5bsPQN8P3I3YSD5RCTiPuJvaO4q/VnxAqnO0mYmC35PelJLa8
 WGXQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781617520; x=1782222320; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERxAhpPnFOTVAXWEfLWOW8cVYW26/7JxRZ3HCmemuZU=;
 b=CJBhnNNsK7r5o42PRzAlvjT0+oKH0bXi2JGd/uH0O2d6wIO+Ldls1pApNF0MBY3/xv
 s0Uy8t8tZn/E3dmUAur7lrzXVtEbIZZm9SQ7aQS3VBgmh8U8yyisa0r1yvGoENUW73cu
 mLfJG/bcTLOPzXwo26WKC74TWnLwncHBzmCDDczBXROKPKWaijvvJ8nyFppXMSPduJb1
 v5nrD0YPIpPzWnND41ipdiB+j1Q3EzSi370HOBIBmuCiR/tf3tlWIZxwFemMXdh2GQ8e
 fMNvcVlcypHkWF7gKB715kFUOFetIcgivZo7ppflc1cCg092lP3XZ0Gt39dpZ+PUom8L
 1p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781617520; x=1782222320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ERxAhpPnFOTVAXWEfLWOW8cVYW26/7JxRZ3HCmemuZU=;
 b=p0kEDuY9onx8Z120+kUhgbOR4Z04/rTYuMXuUqN3RQH8hEP2V3wnXLp+hzIRdzrl9i
 6hUgHSHGaT13F5Q2usngxGcUnA/t3Qm6iy0At8pmiKxOAbxCDe7xyuO2KCE9OvMrsVpC
 Ga0deJeQ5HMEJLnaj368RaIZXsTDBjKNLsg0K1/fddxSfDVXF2K8C7GZu45qxyJy5eP0
 g2bGnCVFWMN3oUX7oHSgxQDK8443VwbWCP59gNqIjm2EURlk6tL/6mlhapvcMJI1+goZ
 kDXY531jUPA+FQQQ1bfRO02rupwQNK3X9Fim1nJ3SK1udZDGeO6LQ6+Myr1Gu6NEztiA
 MEkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/L9rVlyuefAxtts0vYcNaIHcLb2AgzMv1cy6c1B2reQkSp2qyssljk1W/2g4iPpP0DZQdbbGAbpTo7Kf30pbG2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxqlf0/9zwj4f/gVaRz0mMzIULl7ePT+1W5K/BXWFSulupOs4Cw
 aFpZJJsm5j0+ao+MkSIgn0zioCzvkvYnhU3C0fZ7wIWfTnR5U1hmX7SyNHto4ichw6dA95PYROV
 uS5+tg7X8JnXLhfYjG2IvR1fbA6CijY4=
X-Gm-Gg: Acq92OEmH/iFiM5YWlrq6TosF6tWlHmHwCzqRk/jAqKc6bcgXoaS+igaT+CpzUIPxLr
 +/qMNrup/jpHLqKVQENHhwtAIGEHDaUw4rGMPxZPxPfZRg/epfGOSf/FXaIFeQSdHRO8Jnn1iRt
 gd/VkJHUoZJWTmim0XVLx/ZaL/KWEFwFj9G2alT8vIptChx7yZViUAZl3q3mBgM57oOgqusGKsd
 Tnt430FtxLEq68dTaCVFrQN5qFdfVvqqibKvgY1ISSPxGKtVZZeW8pEm+eMXr3vxqMaFFZZOfiU
 ONMw4epG
X-Received: by 2002:a05:6512:3990:b0:5aa:66a5:66cb with SMTP id
 2adb3069b0e04-5ad2db6002fmr5381816e87.25.1781617519774; Tue, 16 Jun 2026
 06:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260528140954.3205736-1-qiwenjie@xiaomi.com>
 <7a1d2390-8416-4e1d-859e-b4ac73c0894a@kernel.org>
In-Reply-To: <7a1d2390-8416-4e1d-859e-b4ac73c0894a@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 21:45:08 +0800
X-Gm-Features: AVVi8CfRKa-vFI4fMJJN7FDxGaCxyCx_mML1VQqOffJPc-5ONjW8I0QAf6dSzVY
Message-ID: <CAGFpFsSQSmx74TZhpFoyZBokfwqnL4myV1www9NX0KTNoEK_Zg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Yes, f2fs_write_inode() already skips updating the
 inode page in this case. The difference is in the caller. Without this patch, 
 f2fs_skip_inode_update() returns false for a full fsync when FI_AUTO_RECOVER
 is not set, so f2fs_do_sync_file() calls f2fs_write_inode() and then [...]
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
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
X-Headers-End: 1wZU6d-0001Zw-AM
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip clean inode update during fsync
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
Cc: jaegeuk@kernel.org, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A30F69010B

ICBIaSBDaGFvLAoKICBZZXMsIGYyZnNfd3JpdGVfaW5vZGUoKSBhbHJlYWR5IHNraXBzIHVwZGF0
aW5nIHRoZSBpbm9kZSBwYWdlIGluCnRoaXMKICBjYXNlLgoKICBUaGUgZGlmZmVyZW5jZSBpcyBp
biB0aGUgY2FsbGVyLiAgV2l0aG91dCB0aGlzIHBhdGNoLAogIGYyZnNfc2tpcF9pbm9kZV91cGRh
dGUoKSByZXR1cm5zIGZhbHNlIGZvciBhIGZ1bGwgZnN5bmMgd2hlbgogIEZJX0FVVE9fUkVDT1ZF
UiBpcyBub3Qgc2V0LCBzbyBmMmZzX2RvX3N5bmNfZmlsZSgpIGNhbGxzCiAgZjJmc193cml0ZV9p
bm9kZSgpIGFuZCB0aGVuIHVuY29uZGl0aW9uYWxseSBqdW1wcyB0byBnb193cml0ZS4KCiAgRm9y
IGEgY2xlYW4gaW5vZGUsIGYyZnNfd3JpdGVfaW5vZGUoKSByZXR1cm5zIHdpdGhvdXQgdXBkYXRp
bmcgdGhlIGlub2RlCiAgcGFnZSwgYnV0IGYyZnNfZG9fc3luY19maWxlKCkgc3RpbGwgY29udGlu
dWVzIHRocm91Z2ggdGhlIGZzeW5jIG5vZGUgcGF0aAogIGFuZCBjYW4gZmluYWxseSByZWFjaCBm
bHVzaF9vdXQuICBJbiB0aGUgY2xlYW4tZmlsZSB0ZXN0IHRoaXMgaXNzdWVkIG9uZQogIGZsdXNo
IHBlciBmc3luYy4KCiAgV2l0aCB0aGlzIHBhdGNoLCB0aGUgc2FtZSBjbGVhbi1pbm9kZSBjb25k
aXRpb24gaXMgY2hlY2tlZCBiZWZvcmUgdGhhdAogIGdvdG8gZ29fd3JpdGUgZGVjaXNpb24uICBU
aGVuIGYyZnNfZG9fc3luY19maWxlKCkgY2FuIHRha2UgdGhlIG5vLXdyaXR0ZW4tCiAgZGF0YSBw
YXRoIGFuZCByZXR1cm4gd2l0aG91dCBpc3N1aW5nIGEgZmx1c2guCgogIFNvIHRoZSBpbXByb3Zl
bWVudCBtYWlubHkgY29tZXMgZnJvbSBhdm9pZGluZyB0aGUgcmVkdW5kYW50IGZsdXNoLCBub3QK
ICBmcm9tIGF2b2lkaW5nIHRoZSBpbm9kZSBwYWdlIHVwZGF0ZSBpdHNlbGYuCgogIFRoZSBpbXBv
cnRhbnQgcGFydCBvZiB0aGUgbWVhc3VyZW1lbnQgaXMKICB0aGF0IHRoZSBiYXNlbGluZSBpc3N1
ZWQgb25lIGZsdXNoIHBlciBjbGVhbiBmc3luYywgd2hpbGUgdGhlIHBhdGNoZWQKICBrZXJuZWwg
ZGlkIG5vdCBpbmNyZWFzZSB0aGUgZmx1c2ggY291bnQuICBTbyB0aGUgYmVuZWZpdCBjb21lcyBm
cm9tCiAgYXZvaWRpbmcgdGhhdCByZWR1bmRhbnQgZmx1c2g7IHRoZSBleGFjdCBsYXRlbmN5IGlt
cHJvdmVtZW50IHdpbGwgZGVwZW5kCiAgb24gdGhlIGRldmljZS4KCiAgVGhhbmtzLAoKT24gTW9u
LCBKdW4gMTUsIDIwMjYgYXQgNDowNOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBPbiA1LzI4LzI2IDIyOjA5LCBXZW5qaWUgUWkgd3JvdGU6Cj4gPiBmMmZzX2RvX3N5
bmNfZmlsZSgpIGNhbGxzIGYyZnNfc2tpcF9pbm9kZV91cGRhdGUoKSBiZWZvcmUgZGVjaWRpbmcK
PiA+IHdoZXRoZXIgaXQgaGFzIHRvIHdyaXRlIGFuIGlub2RlIGJsb2NrIGFuZCBjb250aW51ZSBp
bnRvIHRoZSByZWNvdmVyeQo+ID4gaW5mby9mbHVzaCBwYXRoLgo+ID4KPiA+IEZvciBhIGZ1bGwg
ZnN5bmMsIGYyZnNfc2tpcF9pbm9kZV91cGRhdGUoKSBjdXJyZW50bHkgcmV0dXJucyBmYWxzZSB3
aGVuCj4gPiBGSV9BVVRPX1JFQ09WRVIgaXMgbm90IHNldC4gIFRoYXQgbWFrZXMgZnN5bmMgb24g
YW4gYWxyZWFkeSBjbGVhbiBmaWxlCj4gPiBjYWxsIGYyZnNfd3JpdGVfaW5vZGUoKS4gIGYyZnNf
d3JpdGVfaW5vZGUoKSB0aGVuIHJldHVybnMgaW1tZWRpYXRlbHkgaWYKPiA+IHRoZSBpbi1tZW1v
cnkgdGltZXN0YW1wcyBtYXRjaCB0aGUgaW5vZGUgYmxvY2sgYW5kIEZJX0RJUlRZX0lOT0RFIGlz
IG5vdAo+ID4gc2V0LCBidXQgZjJmc19kb19zeW5jX2ZpbGUoKSBzdGlsbCBjb250aW51ZXMgdGhy
b3VnaCBnb193cml0ZSBhbmQgbWF5IGVuZAo+ID4gYXQgZjJmc19pc3N1ZV9mbHVzaCgpLgo+ID4K
PiA+IEF2b2lkIHRoYXQgdW5uZWNlc3NhcnkgcGF0aCBmb3IgY2xlYW4sIHRpbWUtY29uc2lzdGVu
dCBpbm9kZXMgd2l0aG91dAo+ID4gRklfQVVUT19SRUNPVkVSLiAgS2VlcCB0aGUgZXhpc3Rpbmcg
Y29uc2VydmF0aXZlIGNoZWNrcyBmb3Iga2VlcC1zaXplCj4gPiBmaWxlcyBhbmQgbm9uLWJsb2Nr
LWFsaWduZWQgaV9zaXplIGJlZm9yZSBhbGxvd2luZyB0aGUgc2tpcCwgYW5kIGxlYXZlIHRoZQo+
ID4gRklfQVVUT19SRUNPVkVSIHBhdGggdW5jaGFuZ2VkLgo+ID4KPiA+IE9uIGEgUUVNVS9LQVNB
TiB0ZXN0IFZNLCByZXBlYXRlZCBmc3luYygpIG9uIGFuIGV4aXN0aW5nIGNsZWFuIEYyRlMgZmls
ZQo+ID4gaW1wcm92ZWQgZnJvbSBhYm91dCAzNS43IHVzL2ZzeW5jIHRvIGFib3V0IDEuMTMgdXMv
ZnN5bmMuICBUaGUgYmFzZWxpbmUKPiA+IGlzc3VlZCBvbmUgZmx1c2ggcGVyIGZzeW5jLCB3aGls
ZSB0aGUgcGF0Y2hlZCBrZXJuZWwga2VwdCB0aGUgRjJGUyBmbHVzaAo+ID4gY291bnQgdW5jaGFu
Z2VkIG92ZXIgMTQwMDAwIGNsZWFuIGZzeW5jIGNhbGxzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFdlbmppZSBRaSA8cWl3ZW5qaWVAeGlhb21pLmNvbT4KPiA+IC0tLQo+ID4gIGZzL2YyZnMvZjJm
cy5oIHwgOCArKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJm
cy9mMmZzLmgKPiA+IGluZGV4IDlmMjQyODdkZTRjMy4uZWJkNDg1YWJlY2I0IDEwMDY0NAo+ID4g
LS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMzY2
OCwxMSArMzY2OCwxMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19za2lwX2lub2RlX3VwZGF0
ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgZHN5bmMpCj4gPiAgICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZzYmktPmlub2RlX2xvY2tbRElSVFlfTUVUQV0pOwo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gcmV0Owo+ID4gICAgICAgfQo+ID4gLSAgICAgaWYgKCFpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfQVVUT19SRUNPVkVSKSB8fAo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGZpbGVf
a2VlcF9pc2l6ZShpbm9kZSkgfHwKPiA+IC0gICAgICAgICAgICAgICAgICAgICBpX3NpemVfcmVh
ZChpbm9kZSkgJiB+UEFHRV9NQVNLKQo+ID4gKyAgICAgaWYgKGZpbGVfa2VlcF9pc2l6ZShpbm9k
ZSkgfHwgaV9zaXplX3JlYWQoaW5vZGUpICYgflBBR0VfTUFTSykKPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ID4KPiA+ICsgICAgIGlmICghaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUs
IEZJX0FVVE9fUkVDT1ZFUikpCj4gPiArICAgICAgICAgICAgIHJldHVybiBmMmZzX2lzX3RpbWVf
Y29uc2lzdGVudChpbm9kZSkgJiYKPiA+ICsgICAgICAgICAgICAgICAgICAgICAhaXNfaW5vZGVf
ZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RFKTsKPgo+IElJVUMsIHdpdGhvdXQgdGhpcyBh
ZGRpdGlvbmFsIGNoZWNrIGNvbmRpdGlvbiwgZjJmc193cml0ZV9pbm9kZSgpIHdpbGwgc2tpcCB0
byB1cGRhdGUKPiBpbm9kZSBwYWdlIGFzIHdlbGwgYWNjb3JkaW5nIHRvIHRoZSBzYW1lIGNoZWNr
IGNvbmRpdGlvbiwgc28sIGRvIHlvdSBrbm93IHdoeSB3aWxsIHdlCj4gaGF2ZSBzbyBtYW55IGJl
bmVmaXRzIG9uIGZzeW5jPwo+Cj4gaW50IGYyZnNfd3JpdGVfaW5vZGUoc3RydWN0IGlub2RlICpp
bm9kZSwgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMpCj4gewo+IC4uLgo+ICAgICAgICAg
LyoKPiAgICAgICAgICAqIGF0aW1lIGNvdWxkIGJlIHVwZGF0ZWQgd2l0aG91dCBkaXJ0eWluZyBm
MmZzIGlub2RlIGluIGxhenl0aW1lIG1vZGUKPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKGYy
ZnNfaXNfdGltZV9jb25zaXN0ZW50KGlub2RlKSAmJgo+ICAgICAgICAgICAgICAgICAhaXNfaW5v
ZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RFKSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4KPiBUaGFua3MsCj4KPiA+ICsKPiA+ICAgICAgIGlmICghZjJmc19pc190aW1lX2Nv
bnNpc3RlbnQoaW5vZGUpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPgo+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
