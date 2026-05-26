Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAzCDaOGFWpyWQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 13:40:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 785AE5D5039
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 13:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gfh94HlZX38Eyvgu5MH9Hl57YghsiXZ3b2yw2ho/hS0=; b=Tp4ZV3wfFoLs6WSEoMRKBMgXSr
	rT9O6vsWxIN1od93MQ9X4yNRI+2TdbjS1/cDSZHVVsTSQMJ2IJ5IYXpba1eaIoowy0JYMGMd99gfp
	lU3G4PIJKSnA0jvMT6/HfdCWtTivdeptenBXyy0ybA5lceBiExxNJcvuftqj8I4+XbMY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRq8p-0006rO-7I;
	Tue, 26 May 2026 11:40:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wRq8m-0006rI-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 11:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AuE68QWTDjXxJhuOXj81+H/dNFLHFmhHOTufMSz6duY=; b=L9hWHPPc/mCYrLEMZVn2Le7Rbo
 IC6sDexEGY/dP9bqdL7iYWIkULml+L43cL76NgB78D2L0FhF9Eo63ax7slO130NF3h+Qa0FDNEHPX
 fzmphFsPSU3yk/uEhzjwyu6qu3nnIwUN3SPen7JmXToEWyyCezfepiXwgny3+ts9Gf8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AuE68QWTDjXxJhuOXj81+H/dNFLHFmhHOTufMSz6duY=; b=lJq/B/dKjkhLw03LHkYx/GpS6/
 ZsHtTj+GceEVu1hJZMY/vPbCLgg53ylnw3zVtnmw5Nuh8PGmTc+KGJE7DuI9Pz4VHwySv0IDwMQAs
 1fHcnmCvPORPsQqshZFzha48sJVKfPIzRrINVXoSPGcqfoODsLg5XYYl3Y6SQtcKmzeY=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wRq8g-00042l-OA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 11:40:05 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5aa2d5a1d51so3777157e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 May 2026 04:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779795591; cv=none;
 d=google.com; s=arc-20240605;
 b=lbvd7zJ5KDds1ZGCsU501yHD77mLpH4hv1gvqBfBfvLk54wVYNHXckjj10oBsTVmPe
 nCOdeacGdkHT3ti4T7fTmPEO05Kl6mrjYDkq9ufZVimNViE4vLFpgb/6Np15MYca4EGf
 fodHUkyFYUOZN+xDANTuMD1ODPVlf8NGbs3ytTsEN9Kxri7g7R2Hsz/jUfMvzc6U31JN
 V+m6Fy/1QbMjlViZvxPg1XQ/rDtkWuezsdYYHPW7YosLdBiY3n3CPU35EPPQL8uCUYWV
 Fwxi9CKJBB+TOlmHqWj4WGZJsUzqZ2aUnynXQhswO5BcxaeW/HzTqYZGwovE5gmsKGYr
 2xDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AuE68QWTDjXxJhuOXj81+H/dNFLHFmhHOTufMSz6duY=;
 fh=PJlULDULG59E0K5Xd9KMq9kqkCEqgFD1nlAeaAnE0s4=;
 b=kfwEsIjstIF1rjqeICGlTD0/8pmhUWqBFbzoJxK7FdrQtdvHWctk6aonoAapRRUOK4
 SBvanZUY3zQlt9gaO1SbiNPq4UdVisfXc7GYf0NfSiDgZmeBbpK9PFMhr79emvaX256d
 xY6yd7x2qbdN7+QdYKJBR/9niXbeD5m0IAJz380bL0R7l1OBgXpVAJrGMYxpVBkU79fC
 EZNrJXQnOlEp60QofY3QiKDnt79QZDEShPVgffz24eZ5oBihsF93+C4dHR5d+T/5pLee
 7SOHRMxVLAy24tB+MXHH6MQN3YIbAeDNNkTLEx/Ikc2rLnpMujXSpdmzAo4OguaUJPi+
 pxmw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779795591; x=1780400391; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AuE68QWTDjXxJhuOXj81+H/dNFLHFmhHOTufMSz6duY=;
 b=gX/IGwrhZYXK1zZX4M7N0DXVDRl9naKsyhUQTABEJLf3OU+FlEVfSWicmQwcqc+TT9
 h75yHzGLeMKbdQclUsHh0pJx8q/5pqIb2ER+LJab2XUqmZ64u4/dXvWA0jpsS/grW5Qp
 +OxgrRYukLJuqSR29jyN7MFFl1zO+a76RvQ4tzrfixqn23wiLP57p+muwVaMkMEuFQtj
 VJe1MyrKDyxGW8VTXdpdTnDzjpKjKz6dA/G0Jh78WmpYRwQvPhWBTVSXyOUFhUrFclux
 HRQMr5zPyNigJi/P5LrGKqHSVvMEPHWKyBYLHL9qAUkA45R6Dzts0PHJCqeURp5WZgFI
 yCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779795591; x=1780400391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AuE68QWTDjXxJhuOXj81+H/dNFLHFmhHOTufMSz6duY=;
 b=GcCwaHjnJPnwSdkbgrXQOxNEkPNo7tE/mnqrS5x1XWucHzsrI5y47AOqYiIvhB6AuN
 cjfUJQSnVU1osEMoaCUYwXfJ+1z9ZTYOMj6bU1tNAiDTT7SdzKfvStXvLyZxcGCb9iNC
 AadjtMgSKfz93HYWLxjkjeCcFT/defQol25G49IPb6R9XdFOhcgU1wdY1VVYVwBnUvJY
 nuVkLjJfqC5WHId+eFZJREjBCCVRItJe1t8DhlM8YbgeaZmeWtb4JGRtYbEKuO+aleMk
 ePrCwT1JPFqosH4dDXORZPmEOWY8pNCnOvTJ0GbBYFPc0mFhyKPUZJEGre2nZE65NSgK
 cjbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qauRjgmYL0I3abfSbD15QbhrRQ1ORwES7RHmdcv86drbWceAzfzLkYMKmABRVL9UJFyoEbJXDS8Qo4i9V7QP7@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyhzTSJoGMYUeAZOLfWUhluyXiTM3Y4uGP5+AZgSKndFNAW6vUY
 HteI1+tDwQrvLYDRYEFrzNgyDRvDPplmMUxo1kWUXXKFUrHfvOU55A00jcCdCebgbCRY+rhoyS2
 sXJaUkFg2yRL28MM+qQJoIumHAk4ARuY=
X-Gm-Gg: Acq92OGHwdecLcO4t+BJB1X4y+SOaUrRAl6nujF7fa3eFaOz4m3Jy+ORiVunJj92XPN
 YEXZ8YzeJMUZxwmzL/iu0x8X8uzdaoUGzsi0bGUDNddkHMRvyQ5JbEHt3l45/O4rBimrYhB+9Yf
 +lUNFJTQBQudqRvt+VSfdzAQEU6PizGqGjdThiCFYyUgTOGOoREWILW5EoGrCV14CJZLtBfT6Mh
 KCagAQ6F4C35fh1mot/vZlSNQskosqslknQcHsK1gA3bPA02oe9KAJgSz10LmKGyIbfLOc5tgnD
 1nb/2XiW
X-Received: by 2002:a05:6512:1108:b0:5aa:106f:87bb with SMTP id
 2adb3069b0e04-5aa3237d3d0mr5173917e87.3.1779795591119; Tue, 26 May 2026
 04:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260525114621.571845-1-qiwenjie@xiaomi.com>
 <86c2f79d-ee26-4009-8051-82d25abf6d7b@kernel.org>
 <CAGFpFsQimHFADZGKA2ezyz7eXRG1mMNFOFiJHbsQban_vjb5qQ@mail.gmail.com>
 <534bc0fc-bb0f-4741-9156-11a66d47f1c3@kernel.org>
In-Reply-To: <534bc0fc-bb0f-4741-9156-11a66d47f1c3@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 26 May 2026 19:39:37 +0800
X-Gm-Features: AVHnY4Jd1D5OXqF-D77wYlSiRAOSDzH1-Xe05ivm-yoWqM0B6KkN4CH_Zc3ySAs
Message-ID: <CAGFpFsSYCBPMOkcf2UEX0DCVZG+29zGtNtbsjpBCWA-OKg57iw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yes. I sent a separate f2fs-tools patch to recognize and
 print the new ERROR_INCONSISTENT_ORPHAN s_errors bit in fsck.f2fs: Thanks,
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
 [209.85.167.52 listed in wl.mailspike.net]
X-Headers-End: 1wRq8g-00042l-OA
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate orphan inode entry count
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com, jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,m:stable@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.958];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 785AE5D5039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ICBZZXMuIEkgc2VudCBhIHNlcGFyYXRlIGYyZnMtdG9vbHMgcGF0Y2ggdG8gcmVjb2duaXplIGFu
ZCBwcmludCB0aGUgbmV3CiAgRVJST1JfSU5DT05TSVNURU5UX09SUEhBTiBzX2Vycm9ycyBiaXQg
aW4gZnNjay5mMmZzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8y
MDI2MDUyNjExMzUwNS4xMzEyNDMxLTEtcWl3ZW5qaWVAeGlhb21pLmNvbS9ULyN1CgogIFRoYW5r
cywKCk9uIFR1ZSwgTWF5IDI2LCAyMDI2IGF0IDc6MDPigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gNS8yNi8yNiAxMzozOCwgV2VuamllIFFpIHdyb3RlOgo+ID4g
QWdyZWVkLCBTQklfTkVFRF9GU0NLIG1heSBub3QgYmUgcGVyc2lzdGVkIGF0IHRoaXMgc3RhZ2Uu
Cj4gPgo+ID4gICBJIHNlbnQgdjIgdG8gYWRkIEVSUk9SX0lOQ09OU0lTVEVOVF9PUlBIQU4gYW5k
IGNhbGwgZjJmc19oYW5kbGVfZXJyb3IoKSBvbgo+ID4gICBpbnZhbGlkIG9ycGhhbiBlbnRyeV9j
b3VudCwgc28gdGhlIGNvcnJ1cHRpb24gcmVhc29uIGNhbiBiZSByZWNvcmRlZCBpbgo+ID4gICBz
X2Vycm9yc1tdIGFzIGEgcGVyc2lzdGVudCBoaW50IGZvciBmc2NrLgo+Cj4gU28sIGl0IG5lZWRz
IGFub3RoZXIgcGF0Y2ggdG8gbGV0IGZzY2sgcmVjb2duaXplIHRoZSBuZXcgZmxhZz8KPgo+IFRo
YW5rcywKPgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwv
MjAyNjA1MjYwNTM1NTcuMTA5NjIyOS0xLXFpd2VuamllQHhpYW9taS5jb20vVC8jdQo+ID4KPiA+
IE9uIFR1ZSwgTWF5IDI2LCAyMDI2IGF0IDEwOjE54oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDUvMjUvMjYgMTk6NDYsIFdlbmppZSBRaSB3cm90ZToK
PiA+Pj4gZjJmc19yZWNvdmVyX29ycGhhbl9pbm9kZXMoKSB0cnVzdHMgdGhlIG9ycGhhbiBibG9j
ayBlbnRyeV9jb3VudCB3aGVuCj4gPj4+IHJlcGxheWluZyBvcnBoYW4gaW5vZGVzIGZyb20gdGhl
IGNoZWNrcG9pbnQgcGFjay4gIEEgY29ycnVwdGVkCj4gPj4+IGVudHJ5X2NvdW50IGxhcmdlciB0
aGFuIEYyRlNfT1JQSEFOU19QRVJfQkxPQ0sgbWFrZXMgdGhlIHJlY292ZXJ5IGxvb3AKPiA+Pj4g
cmVhZCBwYXN0IHRoZSBpbm9bXSBhcnJheSBhbmQgaW50ZXJwcmV0IGZvb3RlciBvciBmb2xsb3dp
bmcgZGF0YSBhcwo+ID4+PiBpbm9kZSBudW1iZXJzLgo+ID4+Pgo+ID4+PiBPbiBhIGNyYWZ0ZWQg
aW1hZ2UsIG1vdW50aW5nIGFuIHVucGF0Y2hlZCBrZXJuZWwgY2FuIGRyaXZlIG9ycGhhbgo+ID4+
PiByZWNvdmVyeSBpbnRvIGYyZnNfYnVnX29uKCkgYW5kIHBhbmljIHRoZSBrZXJuZWwuICBWYWxp
ZGF0ZSBlbnRyeV9jb3VudAo+ID4+PiBiZWZvcmUgY29uc3VtaW5nIGVudHJpZXMgc28gY29ycnVw
dGVkIGNoZWNrcG9pbnQgZGF0YSBmYWlscyB0aGUgbW91bnQKPiA+Pj4gd2l0aCAtRUZTQ09SUlVQ
VEVEIGFuZCByZXF1ZXN0cyBmc2NrIGluc3RlYWQuCj4gPj4+Cj4gPj4+IEZpeGVzOiAxMjdlNjcw
YWJmYTcgKCJmMmZzOiBhZGQgY2hlY2twb2ludCBvcGVyYXRpb25zIikKPiA+Pj4gQ2M6IHN0YWJs
ZUBrZXJuZWwub3JnCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlbmppZSBRaSA8cWl3ZW5qaWVAeGlh
b21pLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICBmcy9mMmZzL2NoZWNrcG9pbnQuYyB8IDEzICsrKysr
KysrKysrKy0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2Zz
L2YyZnMvY2hlY2twb2ludC5jCj4gPj4+IGluZGV4IGMwMGE2YjZlYmNiZC4uZmM3MmI2OWZmNzY5
IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ID4+PiArKysgYi9mcy9m
MmZzL2NoZWNrcG9pbnQuYwo+ID4+PiBAQCAtOTQzLDYgKzk0Myw3IEBAIGludCBmMmZzX3JlY292
ZXJfb3JwaGFuX2lub2RlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPj4+ICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBvcnBoYW5fYmxvY2tzOyBpKyspIHsKPiA+Pj4gICAgICAgICAgICAgICBz
dHJ1Y3QgZm9saW8gKmZvbGlvOwo+ID4+PiAgICAgICAgICAgICAgIHN0cnVjdCBmMmZzX29ycGhh
bl9ibG9jayAqb3JwaGFuX2JsazsKPiA+Pj4gKyAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZW50
cnlfY291bnQ7Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAgICAgZm9saW8gPSBmMmZzX2dldF9tZXRh
X2ZvbGlvKHNiaSwgc3RhcnRfYmxrICsgaSk7Cj4gPj4+ICAgICAgICAgICAgICAgaWYgKElTX0VS
Uihmb2xpbykpIHsKPiA+Pj4gQEAgLTk1MSw3ICs5NTIsMTcgQEAgaW50IGYyZnNfcmVjb3Zlcl9v
cnBoYW5faW5vZGVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Pj4gICAgICAgICAgICAg
ICB9Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAgICAgb3JwaGFuX2JsayA9IGZvbGlvX2FkZHJlc3Mo
Zm9saW8pOwo+ID4+PiAtICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBsZTMyX3RvX2NwdShv
cnBoYW5fYmxrLT5lbnRyeV9jb3VudCk7IGorKykgewo+ID4+PiArICAgICAgICAgICAgIGVudHJ5
X2NvdW50ID0gbGUzMl90b19jcHUob3JwaGFuX2Jsay0+ZW50cnlfY291bnQpOwo+ID4+PiArICAg
ICAgICAgICAgIGlmIChlbnRyeV9jb3VudCA+IEYyRlNfT1JQSEFOU19QRVJfQkxPQ0spIHsKPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgImludmFsaWQgb3JwaGFuIGlu
b2RlIGVudHJ5IGNvdW50ICV1IiwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVudHJ5X2NvdW50KTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNldF9zYmlfZmxhZyhz
YmksIFNCSV9ORUVEX0ZTQ0spOwo+ID4+Cj4gPj4gV2VsbCwgYXQgdGhpcyBzdGFnZSwgSSBndWVz
cyB0aGVyZSBpcyBubyBjaGFuY2UgdG8gcGVyc2lzdCBTQklfTkVFRF9GU0NLIGZsYWcsCj4gPj4g
d2hhdCBhYm91dCBpbnRyb2R1Y2UgRVJST1JfSU5DT05TSVNURU5UX09SUEhBTiBpbiBlbnVtIGYy
ZnNfZXJyb3IsIHNvIHRoYXQKPiA+PiB3ZSBjYW4gcGVyc2lzdCB0aGUgbmV3IGJpdCB0byBwcm92
aWRlIGhpbnQgdG8gZnNjaz8KPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+PiArICAgICAgICAg
ICAgICAgICAgICAgZXJyID0gLUVGU0NPUlJVUFRFRDsKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+ID4+PiArICAgICAgICAgICAgIH0KPiA+Pj4gKwo+ID4+PiArICAgICAg
ICAgICAgIGZvciAoaiA9IDA7IGogPCBlbnRyeV9jb3VudDsgaisrKSB7Cj4gPj4+ICAgICAgICAg
ICAgICAgICAgICAgICBuaWRfdCBpbm8gPSBsZTMyX3RvX2NwdShvcnBoYW5fYmxrLT5pbm9bal0p
Owo+ID4+Pgo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gcmVjb3Zlcl9vcnBoYW5f
aW5vZGUoc2JpLCBpbm8pOwo+ID4+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
