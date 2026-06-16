Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /coOH/tJMWqGgAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 15:04:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25768FB91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 15:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="U/nc9rz3";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=EdDzuSqR;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=VIxX5cFl;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=VCa0LiRd;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M48TUZ8EJgkWD3NZggIwsvbE5ScIORGxa2K79Cif8bA=; b=U/nc9rz3/q7KxCztfEWLuUxErk
	KiW9WQN7PRxZvBYLgqBv/cATEDwGw7cGxvqEBdZqsdraJWhVKlweJwbaT7ZjGXEJa3d9UQpsSyE5W
	SXWV2PclrvvFASc1NGkCkHtFEJbe6qyC0BhMMmmh5AwJZmzikIcRrcJ+rY1UKk/gon14=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZTTC-00086T-5j;
	Tue, 16 Jun 2026 13:04:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZTT5-00086E-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 13:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDF9H9B2QrYu4fuqP3IM4X+fPEPVbVQJuUMqjst39/k=; b=EdDzuSqRBJkOeWhyKZH58UUd+E
 d2/VVpBx49jip7R3/jNDynCDlmnmxX5lrUGg3O8AW+NW8TdV/sjNamrgNiRLM8YHW3KtgLyZZ5n22
 P1XZVXvCdlvCjz2HSY9MkIoiSzOzy7nHWk/2JSnHz9Qjc4I7By2B8vVupIuSpVydoOJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xDF9H9B2QrYu4fuqP3IM4X+fPEPVbVQJuUMqjst39/k=; b=VIxX5cFl+KwMvSFvvZLffh9hK7
 0DPx5UxYwl3YxRA4oddJ31YPc0Y00Di4C2WcH6p2Jpnh8YAumiei2Zc5I2C8z5f8qNxK3GUPqa+hi
 jWcMwWm6cCnZ2Vs9/K+QPK66fu6Fm27lYM1DJtzsRrTVpGWc+VZm+VDtrER+2NE+YRlQ=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZTT0-0007E3-47 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 13:04:36 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5aa5e0d57e5so3329793e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 06:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781615068; cv=none;
 d=google.com; s=arc-20240605;
 b=UE3ZrDqksA7BaBRDtlHe3rVUc7I80D+Han87i/fhQP2GItLq73SbrfCCqYApUA77Q1
 Nv/Bsr2TguvTJzV31kgYFOmfsJb8EPD7e5Iboix6r8LCAcphpNhVYKby8i4iVl+FEaH2
 XrOlNLXTYe7AOywhPuMMF44/8ViTXWYJ4dJsSQV7j0/F493/NUPvWDpHNdJTc6H+PLdp
 AQf8YoSpTDqmuDt+kpu8Mq5HXF32MBFYMEEQVq91aAgzDnwzx3fS7thhmoCigkDS4vRu
 BtFTh0WAesEtFlGUz+FUE61NcXRCcUZRoM8PO8UkOzVgqUKGc+lS6zD2UwwZs5jF+gM5
 ddlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xDF9H9B2QrYu4fuqP3IM4X+fPEPVbVQJuUMqjst39/k=;
 fh=jkYwxLJ+46Z6FGoaZXffuire514kOVHtQNOShc1psL4=;
 b=b03k5HJtwBXdkkBOVE3hJIegk0n+m+z+rRMUtb9tSg3QHQ4pctsBi7LS+E1/ysC22X
 wvOP3hQxvH60d0E+tu4+zQg3vjvqug+KMLXlhZfHzvVOi/RjoKQZfBaNkVFi+PevPI9U
 iuMi1+iyAxGtC/iBGBYb8+wW1BE6+p04lyocm/z0n1pz9fQt3RlHd0naEqKTnnaybYff
 xfceehudy9ItkLobT1fhS8t+b7u16iQXUYtDVJ+byrA9p2ODk3+zJS77Zx34+wjuPqmT
 ZizgRcDCtrkp8l7zsnHAdUWML1IFY53VELVm5pSzGYkhsi5ZEQpAOAXtf8Y+qLhxBAwG
 X4yg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781615068; x=1782219868; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDF9H9B2QrYu4fuqP3IM4X+fPEPVbVQJuUMqjst39/k=;
 b=VCa0LiRdq7rX/pFdFS9nhzjnLzQzfKS1NVJ5pTLzO8A2dBzmEUhKhFdQqRTSz2f4VC
 0fPedIsPBblmeH6dQYi8IyD5U1YAzA+7FzOWXoWxNr9y8mkYB5YCvfC85dcR28tj0qc8
 c2WYIZeeDi51HK17HmjSK+gsPfm+y1Qty2bAfseFQ4+PHLDSSNCYE/rCfN33S46HOXCf
 uEFO/EigUX+q6TaM4qfx1xKcWwFEqcLV4IxtgEykonarM8l36gxiMtaTay5n95klVHTt
 6oNbrNZNLt1BWRSrcta5dxECiI0KvsmWdR4FdgyxYW87lOZrHnkzU8nowP7OSmAQ4hoq
 C0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781615068; x=1782219868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xDF9H9B2QrYu4fuqP3IM4X+fPEPVbVQJuUMqjst39/k=;
 b=IAirYoYwkC9A4uSHZcz4Ls6JJSt1LXibnXjnOitI65eIqf4sD703f1eQnIqGfaylnM
 B9jIKwkTEbZjr5W9TWP+1yr4sZcyTFPwIjaHez4ag1wcsuZZymLHd/46Zl9M5YleC5qV
 a9pF/w8wq50qbYK9kNQwu3V5QLptWIgAVUS8JwL6+4h9B8QVVG23ITxZlz275RvqzRoZ
 fPDMmCJMdCKx5NEUhvK00g7+SP+GUFnF4bSpjl8SFcLXILZhqGFwIwp69I0I+BpGDr2z
 CJEoZ8haREx5EEez5CyPdkUB0N9daGBfzQntU/ynPTEPl4RFaX9zzdqlpMZ9fPu6ba/N
 uAQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RiR7G4DaKbtAW3l07dtDXnXm9j18xa2Kd0KuH2d+/cncAeuzgKQGMDiVei9qtdpg3DB6IjYMOLm4+/Ur43I55@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxm3BEgzgUeHT+ieGeCrcUjE7MVV5H2NkcU6eaZiS/rdXdE4tBw
 UH+6a/37ee9vQOHfpS+sX0C1sZPjySmKau2G0jOLVJQ9RLQiUswynjK44rcrP5Vl3r71W+1LEYE
 mlY4BIrHHOUXLL3K8z9qMvaOJPfBVtIQ=
X-Gm-Gg: Acq92OETfsdTHfhLh3pq8vbMBZGt9twHY9pxmzte3gmNjtfRzhf2+UVBXNC04HRjrec
 QhQdcsgsgRR4ljD2x3A4avl/w83C52Imch61Ic2LxX+8/kYGY/bjctxvwBvsouIBGyoAHlTAM0L
 m3yOQxctd0xQwINB6tTVOuCDmbqUYo+Yoj4jonckNuAzv47xPTLM9nDaD3qR+4fD5Pm17Wmux+Z
 l8tHxookTc+AiuHiOrsAqoM+4g9YJ2h+Woe6oYg3lYc4VSJI5YyLT74R7eszk+2zdaeiMRGXDab
 915M65Qn4SL5Nk2PJBs=
X-Received: by 2002:ac2:4422:0:b0:5aa:8824:1570 with SMTP id
 2adb3069b0e04-5ad2db8a4f6mr3825623e87.48.1781615067302; Tue, 16 Jun 2026
 06:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260525061456.231710-1-qiwenjie@xiaomi.com>
 <ajBfZSpf2I8s67ze@google.com>
In-Reply-To: <ajBfZSpf2I8s67ze@google.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 21:04:15 +0800
X-Gm-Features: AVVi8CfOWNYmMxK6XoFkexArHTR3wMRaUSBlAlc56oaD0VCyG1fYkC-v9eMbvqM
Message-ID: <CAGFpFsS0Edkcg7WTD+nbnqBwc6yiyM2=nWcNFYjYUA5NfeOuNw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I see. The old patch assumed compressed writeback should
 follow the F2FS_WB_CP_DATA path because the current code accounts it that
 way. After rechecking it, I agree that stopping checkpoint from this path
 is not the right fix. 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
X-Headers-End: 1wZTT0-0007E3-47
Subject: Re: [f2fs-dev] [PATCH] f2fs: stop checkpoint on compressed write IO
 error
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
Cc: yuchao0@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:yuchao0@huawei.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:stable@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[xiaomi.com:server fail,lists.sourceforge.net:server fail,mail.gmail.com:server fail];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF25768FB91

ICBJIHNlZS4gVGhlIG9sZCBwYXRjaCBhc3N1bWVkIGNvbXByZXNzZWQgd3JpdGViYWNrIHNob3Vs
ZCBmb2xsb3cgdGhlCiAgRjJGU19XQl9DUF9EQVRBIHBhdGggYmVjYXVzZSB0aGUgY3VycmVudCBj
b2RlIGFjY291bnRzIGl0IHRoYXQgd2F5LgoKICBBZnRlciByZWNoZWNraW5nIGl0LCBJIGFncmVl
IHRoYXQgc3RvcHBpbmcgY2hlY2twb2ludCBmcm9tIHRoaXMgcGF0aAppcyBub3QKICB0aGUgcmln
aHQgZml4LgoKICBJIHNlbnQgYSBzZXBhcmF0ZSBwYXRjaCB0byBmaXggdGhlIGFjY291bnRpbmcg
c2lkZSBpbnN0ZWFkOgoKICBmMmZzOiBhY2NvdW50IGNvbXByZXNzZWQgd3JpdGViYWNrIGJ5IHJh
dyBmb2xpbyB0eXBlCgogIEl0IGRlcml2ZXMgdGhlIHdyaXRlYmFjayBjb3VudCB0eXBlIGZyb20g
dGhlIHJhdyBwYWdlY2FjaGUgZm9saW8sIHNvIG5vcm1hbAogIGNvbXByZXNzZWQgd3JpdGViYWNr
IHN0YXlzIGluIEYyRlNfV0JfREFUQSwgd2hpbGUgZ2NpbmcvQ1AtZ3VhcmFudGVlZCByYXcKICBm
b2xpb3Mgc3RpbGwgdXNlIEYyRlNfV0JfQ1BfREFUQS4KCgoKCgpPbiBUdWUsIEp1biAxNiwgMjAy
NiBhdCA0OjI04oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBPbiAwNS8yNSwgV2VuamllIFFpIHdyb3RlOgo+ID4gQ29tcHJlc3NlZCBkYXRhIHdyaXRlcyBh
cmUgYWNjb3VudGVkIGFzIEYyRlNfV0JfQ1BfREFUQSBiZWNhdXNlIHRoZXkKPiA+IHdyaXRlIGNv
bXByZXNzZWQgcGFnZXMgdGhyb3VnaCBmaW8tPmNvbXByZXNzZWRfcGFnZS4gIFRoZWlyIGVuZF9p
byBwYXRoCj4gPiBzaG91bGQgdGhlcmVmb3JlIGhhdmUgdGhlIHNhbWUgY2hlY2twb2ludC1zdG9w
IGJlaGF2aW9yIGFzIG9yZGluYXJ5Cj4gPiBGMkZTX1dCX0NQX0RBVEEgd3JpdGVzLgo+ID4KPiA+
IEhvd2V2ZXIsIGYyZnNfY29tcHJlc3Nfd3JpdGVfZW5kX2lvKCkgb25seSByZWNvcmRzIC1FSU8g
aW4gdGhlIGlub2RlCj4gPiBtYXBwaW5nIHdoZW4gdGhlIGJpbyBmYWlscy4gIFRoZSBmaWxlc3lz
dGVtIGNhbiBrZWVwIGNoZWNrcG9pbnRpbmcgYWZ0ZXIKPiA+IHRoYXQgZmFpbHVyZSwgc28gYSBs
YXRlciBjaGVja3BvaW50IG1heSBwZXJzaXN0IG1ldGFkYXRhIHRoYXQgcG9pbnRzIHRvCj4gPiBj
b21wcmVzc2VkIGRhdGEgYmxvY2tzIHdob3NlIHdyaXRlYmFjayBmYWlsZWQuCj4gPgo+ID4gU3Rv
cCBjaGVja3BvaW50aW5nIHdpdGggU1RPUF9DUF9SRUFTT05fV1JJVEVfRkFJTCBmb3IgZmFpbGVk
IGNvbXByZXNzZWQKPiA+IEYyRlNfV0JfQ1BfREFUQSB3cml0ZXMsIG1hdGNoaW5nIHRoZSBvcmRp
bmFyeSBkYXRhIHdyaXRlIGVuZF9pbyBwYXRoLgo+ID4KPiA+IEZpeGVzOiA0YzhmZjcwOTViZWYg
KCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+ID4gQ2M6IHN0YWJsZUBrZXJuZWwu
b3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZW5qaWUgUWkgPHFpd2VuamllQHhpYW9taS5jb20+Cj4g
PiAtLS0KPiA+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCA1ICsrKystCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+IGluZGV4IGNhZjUyMmQ2
NjdkNi4uOWIxNTAxMDA0NDU2IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4g
PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+IEBAIC0xNDg4LDggKzE0ODgsMTEgQEAgdm9p
ZCBmMmZzX2NvbXByZXNzX3dyaXRlX2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBmb2xp
byAqZm9saW8pCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2lzX2NvbXBy
ZXNzZWRfcGFnZShmb2xpbykpOwo+ID4gICAgICAgaW50IGk7Cj4gPgo+ID4gLSAgICAgaWYgKHVu
bGlrZWx5KGJpby0+Ymlfc3RhdHVzICE9IEJMS19TVFNfT0spKQo+ID4gKyAgICAgaWYgKHVubGlr
ZWx5KGJpby0+Ymlfc3RhdHVzICE9IEJMS19TVFNfT0spKSB7Cj4gPiAgICAgICAgICAgICAgIG1h
cHBpbmdfc2V0X2Vycm9yKGNpYy0+aW5vZGUtPmlfbWFwcGluZywgLUVJTyk7Cj4gPiArICAgICAg
ICAgICAgIGlmICh0eXBlID09IEYyRlNfV0JfQ1BfREFUQSkKPgo+IEl0IHR1cm5zIG91dCB0aGUg
dHlwZSBzaG91bGQgbm90IGJlIEYyRlNfV0JfQ1BfREFUQS4KPgo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgdHJ1ZSwgU1RPUF9DUF9SRUFTT05fV1JJ
VEVfRkFJTCk7Cj4gPiArICAgICB9Cj4gPgo+ID4gICAgICAgZjJmc19jb21wcmVzc19mcmVlX3Bh
Z2UocGFnZSk7Cj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
