Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0wrhGSthI2pErwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 01:52:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1964BDEB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 01:52:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="mY/q6rNy";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fUAwCXR6;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=RN7spi0h;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=OE94qiPe;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QyFeN8XsdxvD9S/SXP9PU5/AU9N8M9P/DEu9VMupYU=; b=mY/q6rNyyelOZsXwQc9IcZDwhy
	XsnVFk+OxW6qXPAR15TY7wr6ucm7wBCN/NFSdeckZM92P0l5mgNQxja8Ur3ybRw+8KY398LUcZJ0G
	Uv5gPa73KIUylCZi2mLh2dM9wkAbXj/yMS3mMsrd7IUW/q7oZ8CuRqUosf8yhJrfEKtE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVeKV-00087b-V5;
	Fri, 05 Jun 2026 23:51:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wVeKV-00087V-10
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 23:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hAXWVRy8PAWSshytx6nzO3Og9A8JaBpnr8Hs6JzvwZw=; b=fUAwCXR6W9OfUc334vu+8Jk++8
 EinahPAPCrki++qO0N/cIYatDANJGu/wbDbG8I9RJbTK1i+QpIIXA3NDkO536GDJIEHxwsjYHMacX
 lAWPPXCvGpYMspqKdIJbiLhQcuU30rz81fAXZr0/QmNOrFbM74aLUCYwPvBGuYTHY6i4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hAXWVRy8PAWSshytx6nzO3Og9A8JaBpnr8Hs6JzvwZw=; b=RN7spi0hufyzpDpZmGXrqgs27C
 C0eKaRdMAaItinMDBeDCItLEGUN7XGbvlSuBlZ6ryUpLgYzJYxLfBKrdoAb3bK3D0MH59YHqEcIGM
 JCA+SdH14LhXrNVZF8X281Ocwo01bOI0ZlGv/Dc6c6y/ANb7lNfssAEYo/+GGean66iU=;
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wVeKU-0002N8-2n for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 23:51:58 +0000
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-6c5ac3fa819so725866137.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2026 16:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780703507; cv=none;
 d=google.com; s=arc-20240605;
 b=haDEo4ZRQURPCMfLqaPSGoxL3Ry8DSnCcsJ5hNJEsUh++MoLVDBIKIaIC1sfOsHx5+
 dQgWu5rxtDkCtd5oNu92dC++mank4rROzTA5Y43FXo5DwR+j4AwT26Zi8vS3RzRwZoGI
 CHdmBolNt89DbtIEMPiVewOepFCaeI3/axSv15jkPrKzlXGeLpQdMXDLCnrKh6JxxwA1
 biIARIP2EJaSvfM9vMNylrfpP+6D6q35FiEc7Gi7owDs0Kse349hSA8lIsVvQC4/+gop
 xOw8VKdfS1sHPWexMRjjnCfRpjrPDOu6qj8SItB7VoUjb8zIqUdxGDU3Z2BcZQdl8c5G
 EdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hAXWVRy8PAWSshytx6nzO3Og9A8JaBpnr8Hs6JzvwZw=;
 fh=Uyak2hEsG//SnpchQUnmtyPiGEFFvzzRJh00Z9tpPho=;
 b=NldCqFUg7aPIWK+pREG2zLm+Dcqu3Z4689k8bGFWB0cz2S9CwecjTVG8jBtvjNABPx
 53s2cJuCzigfNBaFUVjhQ836xp7wZ5G7LaMNT0eaILTbS67IaSBc4m9DLEyjglaiEGUT
 CNEGg0L3/HfmtM/D3GXBW4Pea0QwGZPaMDJVGdIHfq1ky76TDKTWJqjr37T2V787Bw6Z
 S/GZ7o7WiBEFLaXPTxernAlc3STlxPKzcAzuJKwDqHPe6NzxPMZDLuQXF1wQ0n8VHzMd
 8AmN5pxlLqMORwr4f4OL70IrsUSB0kzXRM/TJtGNEqLbzQrk9/AvAmhuPOcwzn01QomC
 og3w==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780703507; x=1781308307; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAXWVRy8PAWSshytx6nzO3Og9A8JaBpnr8Hs6JzvwZw=;
 b=OE94qiPeKvz0eoa9shzSwrLgeoDzBDnoQCZ7R8/rFqTHCfpQdySkMbhr+T74rRedbF
 co95NDZH/XIbpEwF8nAB8IYgDCjOtM9qohGbtvmo9LGRsyoQn1rlhsPwDDlX9P1OpK6J
 dQ3Mbu6WdwIHNsu5u2yjTNZwEPs7FNOcS3gQAXm6sm5NCFlR9eXeKPJPBa3amvehOgIv
 YVWXQ29sKuKB0kC6ZC0FBh785SwoGcI8hNxtGbJIvy5uG1m7iW/3SK6zsttI6T5R1fOl
 P17na5KVW8ZQpsNpLi/ilbYBeSw4MCCgQhQy8VHHv5RUhTXZgF17pxxfpTt6Op5zuaAD
 eNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780703507; x=1781308307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hAXWVRy8PAWSshytx6nzO3Og9A8JaBpnr8Hs6JzvwZw=;
 b=Dv+oO++PQPiwMYmQGCBGL7gizTSEo1zWGQyBfvrKOikb7Clt+a5A1mzjba5Rn0Jc7g
 CNAEGpNyn6HFSvlqupVznDqCDPzuRir0zXE8m8F53Jh1OeFV6roCYmAPSypjqid/OrSJ
 wgO8waqRZUHpnGr905o9efpG1lLX4On28u4ZtLdofykoPjbWwMVVHCNeADldmaUnpN1p
 FJE8C8ZA9KWwtnaTsDfg4MP3se0GEn02lZhZ6qer1D03nBQwNc/LKNe0tcMLgDs2z/yE
 VjFXilXcYwC13ycBaOeYOaySU4y2V04gKoSMMp7s3WIOR1v6fFR7HcE+2mYjMoRexIFr
 marQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8TsddurzEC5mHSAqbukxKG0potNqBYKkdUil/Vp1787AHQJnPwWFRA2Tb24Sm6E1u4RmVOYJeq5/Okiql0E/v5@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzGhcYUAV75DU/IFkyBDvLa0kLsOKWW+6Xi+eOvsPHrYrLVAC18
 i3o88zQ+5cFbL75jhcJpE5jOel6954TlXGfDbrwkfIkrFkUu7t4DPSqOeeqKYyBZDU0E0nqeD4Z
 dqnICuJxId2TJ7PkFUfGxAH+qNxzeyfDaSVu6
X-Gm-Gg: Acq92OFfuSpH33O95hi6KQhoN3cvU8RvHjXlR1OtQxvNZN9KNbiAuqjijBImYtOuTsD
 hXpEUymBN3l70N95W7T4ahuT6zlvCo9MM0Updn21/m/4WeAEGLRBAUwKQWcOKKn9w1sPzV2dTnZ
 BF8XgSjM0Rwrqmny9huYu1Y/EiM/cdvLFIy4TBedE+Fm6Y/9t8JU7vWXkbmC3Tx6HEbjgtP9m+G
 0nJujuc6TO0CWfjC3RV0phhTD7SXp4pcr1mkotxNPXgPGw2LqVw2iB+Clfon18QGI7P8IKBLlXx
 gtazR9T1ZKSOLsAhu7ONboxWjdYVce/okS+gjarie2umbTFvExH9CvOgk2jNn45MhAUso4M9fUJ
 NSmARQ2E=
X-Received: by 2002:a05:6102:6a90:b0:6a2:cfe7:20b3 with SMTP id
 ada2fe7eead31-6feef48d112mr3061538137.2.1780703507519; Fri, 05 Jun 2026
 16:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260605212504.1080138-1-daeho43@gmail.com>
 <20260605221027.GA2312230@google.com>
In-Reply-To: <20260605221027.GA2312230@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 5 Jun 2026 16:51:34 -0700
X-Gm-Features: AVVi8Ce3u7bt1mZIi50SKs_GCeneIDl2nMigryDetlCOfKdmCVvK_ui0YKAoQKY
Message-ID: <CACOAw_xrMij0pXjFkS4gY0kt5buvfZ0gmzbcP+zx4-ox7n+_3Q@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 5, 2026 at 3:10 PM Eric Biggers wrote: > > On
 Fri, Jun 05, 2026 at 02:25:04PM -0700,
 Daeho Jeong wrote: > > - F2FS_IOC_EXCLUDE_DEV_ALIAS:
 This reclaims the space occupied by a > > device [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.49 listed in wl.mailspike.net]
X-Headers-End: 1wVeKU-0002N8-2n
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support dynamic include/exclude for
 device aliasing
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EA1964BDEB

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCAzOjEw4oCvUE0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDA1LCAyMDI2IGF0IDAyOjI1OjA0UE0g
LTA3MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gLSBGMkZTX0lPQ19FWENMVURFX0RFVl9BTElB
UzogVGhpcyByZWNsYWltcyB0aGUgc3BhY2Ugb2NjdXBpZWQgYnkgYQo+ID4gICBkZXZpY2UgYWxp
YXNpbmcgZmlsZS4gSXQgZmlyc3QgcGVyZm9ybXMgYSBjYXBhY2l0eSBjaGVjaywgcmVzZXRzIEdD
Cj4gPiAgIHZpY3RpbSBpbmZvcm1hdGlvbiBmb3IgdGhlIHRhcmdldCByYW5nZSwgbWFya3MgdGhl
IHNlZ21lbnRzIGFzIGluLXVzZQo+ID4gICB0byBwcmV2ZW50IG5ldyBhbGxvY2F0aW9ucywgYW5k
IHRoZW4gdHJpZ2dlcnMgR0MgdG8gbWlncmF0ZSBleGlzdGluZwo+ID4gICB2YWxpZCBkYXRhIG91
dCBvZiB0aGUgcmFuZ2UuIEZpbmFsbHksIGl0IHJlc2VydmVzIHRoZXNlIGJsb2NrcyBpbiB0aGUK
PiA+ICAgU0lUIHRvIGVmZmVjdGl2ZWx5IGV4Y2x1ZGUgdGhlIGRldmljZSBmcm9tIHRoZSB1c2Fi
bGUgY2FwYWNpdHkuCj4KPiBEb2VzIHRoaXMgZG8gYW55dGhpbmcgdG8gemVyb2l6ZSB0aGUgZGV2
aWNlIHNvIHRoYXQgcmFuZG9tIGRhdGEgaXNuJ3QKPiBsZWFrZWQgaW4gaXQsIG9yIGlzIHRoYXQg
dGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZSB1c2Vyc3BhY2UgY29kZSB0aGF0Cj4gcmVhbGxvY2F0
ZXMgdGhlIGRldmljZSB0byBzb21ldGhpbmc/CgpCeSBkZWZhdWx0LCB0aGlzIGlvY3RsIGRvZXMg
bm90IHplcm9pemUgb3IgZGlzY2FyZCB0aGUgdW5kZXJseWluZwpwaHlzaWNhbCBkZXZpY2UgdXBv
biBleGNsdXNpb24uCgpDdXJyZW50bHksIGVuc3VyaW5nIHRoYXQgc3RhbGUgcmFuZG9tIGRhdGEg
aXNuJ3QgbGVha2VkIGlzIHRoZQpyZXNwb25zaWJpbGl0eSBvZiB0aGUgdXNlcnNwYWNlIGNsYWlt
aW5nIHRoZSBibG9jayBkZXZpY2UuIFdlCmRlbGliZXJhdGVseSBkZWNvdXBsZWQgYnVsayB6ZXJv
aW5nL2Rpc2NhcmQgZnJvbSB0aGUga2VybmVsIGlvY3RsCmJlY2F1c2U6Ci0gU3luY2hyb25vdXNs
eSB6ZXJvaW5nIG91dCBvciBpc3N1aW5nIG1hc3NpdmUgYmxrZGlzY2FyZCByZXF1ZXN0cwphY3Jv
c3MgbXVsdGktZ2lnYWJ5dGUgcGFydGl0aW9ucyBpbnNpZGUgdGhlIGlvY3RsIHdvdWxkIGludHJv
ZHVjZQpwcm9oaWJpdGl2ZSBJL08gbGF0ZW5jeSBzcGlrZXMgYW5kIHVubmVjZXNzYXJ5IGZsYXNo
IHdlYXIgKFAvRQpjeWNsZXMpLgotIEFjY2VzcyBDb250cm9sOiBUaGUgRjJGU19JT0NfRVhDTFVE
RV9ERVZfQUxJQVMgaW9jdGwgc3RyaWN0bHkKcmVxdWlyZXMgQ0FQX1NZU19BRE1JTi4gVW5wcml2
aWxlZ2VkIHVzZXJzIGNhbm5vdCB0cmlnZ2VyIHRoaXMKdHJhbnNpdGlvbi4KLSBSYXcgRGV2aWNl
IFByb3RlY3Rpb246IEFjY2Vzc2luZyB0aGUgZXhjbHVkZWQgcmF3IGJsb2NrIGRldmljZQpkaXJl
Y3RseSByZXF1aXJlcyByb290L2Jsb2NrLWdyb3VwIHByaXZpbGVnZXMgYW5kIG1hdGNoaW5nIFNF
TGludXgKcGVybWlzc2lvbnMuCi0gZnNjcnlwdCBFbmNyeXB0aW9uOiBJbiB0eXBpY2FsIHByb2R1
Y3Rpb24gZW52aXJvbm1lbnRzIChzdWNoIGFzCkFuZHJvaWQpLCBmaWxlIGNvbnRlbnRzIGFyZSBl
bmNyeXB0ZWQgdmlhIGZzY3J5cHQuIFN0YWxlIGRpc2sgcmVtbmFudHMKcmVtYWluIHVucmVhZGFi
bGUgY2lwaGVydGV4dCwgcHJldmVudGluZyBtZWFuaW5nZnVsIGRhdGEgbGVha2FnZS4KCkhvd2V2
ZXIsIGlmIHlvdSBiZWxpZXZlIGEga2VybmVsLWVuZm9yY2VkIHNhbml0aXphdGlvbiBtZWNoYW5p
c20gaXMKbmVjZXNzYXJ5IHRvIHByZXZlbnQgaXQsIHdlIHdvdWxkIGJlIGdsYWQgdG8gc3VwcG9y
dCBhbiBvcHRpb25hbApzZWN1cmUgemVyb2luZy9kaXNjYXJkIGZsYWcgaW4gdGhlIGV4Y2x1ZGUg
aW9jdGwuCgo+Cj4gPiBAQCAtMjIxNCw3ICsyMjMxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7
Cj4gPiAgICAgICAgICAgICAgIEZTX0lOTElORV9EQVRBX0ZMIHwgICAgIFwKPiA+ICAgICAgICAg
ICAgICAgRlNfTk9DT1dfRkwgfCAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICBGU19WRVJJ
VFlfRkwgfCAgICAgICAgICBcCj4gPiAtICAgICAgICAgICAgIEZTX0NBU0VGT0xEX0ZMKQo+ID4g
KyAgICAgICAgICAgICBGU19DQVNFRk9MRF9GTCB8ICAgICAgICBcCj4gPiArICAgICAgICAgICAg
IEYyRlNfREVWSUNFX0FMSUFTX0ZMKQo+Cj4gVGhpcyBpcyBleHRlbmRpbmcgRlNfSU9DX0dFVEZM
QUdTLCB3aGljaCB5b3UgcHJvYmFibHkgZG9uJ3QgcmVhbGx5IHdhbnQKPiB0byBiZSBkb2luZywg
cmlnaHQ/CgpJdCBzZWVtcyBteSB0ZXN0IGNvZGUgd2FzIG5vdCBwcm9wZXJseSBjbGVhbmVkIHVw
IGJlZm9yZSBzdWJtaXNzaW9uLgpJJ20gc29ycnkgYWJvdXQgdGhlIGNvbmZ1c2lvbi4KCj4KPiAt
IEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
