Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNH/JL7bsmlMQQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 16:29:02 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5F9274739
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 16:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJz2FICYVurDa7VWXYPnwTkHZKErT6cl1+qaEPTG0fU=; b=SYVpr61zoCymI8lagGXO4Ot3HV
	Q+e65vvOYtr4XHkKqZH4izr3FV71goJcq2o+jFBdnHcpsNBkcw8riOYYarQ1dst+k4MWqsxgEsbRx
	X8zRI4qBEjKKrc1/T7aJYBBbF9CzlqqOpl0M9ULz3c1oYwk5RaNKmJp8mvIFpxQ02nnQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0hxz-0004xL-7s;
	Thu, 12 Mar 2026 15:28:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w0hxx-0004x8-VS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 15:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aoOSO/yJkuQuCs7i0xGJ+CSpNID0i7Y5EM4g6tQZvJ8=; b=HbmvHhERs/gUNqHiQZcUF6yyce
 wp0azWLs1CAyxfe2CcFXeJ3VmvD3ggd95PtNlnZ3p1S39AagXFllErXwbgGwhLna5DkmWPyOe1xxc
 ScqQgwSLim2zhZ+4mt+eqrC9Y+dbMGIaUyWDoSw7sTByS8UkNhtcvidnxzgQrNGF0UKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aoOSO/yJkuQuCs7i0xGJ+CSpNID0i7Y5EM4g6tQZvJ8=; b=NkcAkwh1/a4tGQ0D5diMBSg8HL
 Dwp31wXT/JvixybgzePJfzuUFYnPt7etEGBOtHVN3PkyMef9T62PuPTahDCrxjikJc7/Wb2xcfbtt
 BieJH2t2cxUVtSKFkxCnmfEk9vIWm4HqzSJTkIMTxjxXjbuEIXRnc/s3psH+Jv3i8g6U=;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0hxy-0005rN-AA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 15:28:50 +0000
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-5ffea5acd19so741298137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2026 08:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773329324; cv=none;
 d=google.com; s=arc-20240605;
 b=XHasH6EZd22UURI03b8RYmZ4HH+ox1s+ELUuSR+C0L0gfWVEBmmo2yrlJRqNPnX36r
 aFC/9TUOvY3SIgDZsWSM4zNF3cIDc5sJSJVMhKqzD5phX+GOuimpxvlb0z5N4s/6SiyE
 CoRU3+3X3yZDfCyOPLgRWXLglaMwCaS+WDfLWNs+IEI8WrRwrBCAVp9Juwxh13vYqo1R
 WePk56J7WVav4ThPBuhGCWgqFH8ZE4HTGOIhotXSwsKDnKd6dx/bFv0bDD5VEerQzs19
 g3fna2IbVu4yHtDFyd63oOH329QiVp7IglHREJ2v6Wa0CVaWwnzs67eDPojyEbDpQjWD
 u0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aoOSO/yJkuQuCs7i0xGJ+CSpNID0i7Y5EM4g6tQZvJ8=;
 fh=TbOLL6clxuTQhxF78y7eZTehLYWegemVzYLznEqkQGI=;
 b=IS7yzM5k/SVIEpIqDdPrgMWnI9qwsPQLyQm+FpFpFgccH5m7roU0TX5YRUYprVDduc
 J38H0b2pJSCh3HEQrIW7noNYmJAqyH387t+L7v6/LtNabbqdELAswhSJ0H9XC3qh7bIL
 3uVfuC7TSeuei9VA+wd2D8hnnwfI9reffDWKSVYF/foB/50O8SMWGUVBVs/Gq7Arp9S7
 PIa/yCk8J5QtEYLa/4Wn2Evj6UvF2G+4mgaHANADZPuw8zwRy7VGHbhSv+GEGAQXVYN4
 F/EsVcU2LQxyXWjvxcecpJx9gISRcp9CwjomuymJ78Xu/0Vg7jfQDumWGoCFl50VUW52
 cmRw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773329324; x=1773934124; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoOSO/yJkuQuCs7i0xGJ+CSpNID0i7Y5EM4g6tQZvJ8=;
 b=Ubcu2vpqnU+Tp4aJH/pkqm/StDSq9immCMF651BcrZDM0xxTD721HtlRavQmCSsU1a
 DzNaB3x+Vi88+vLsSIimBUmIaSKJBmJYhQ2WmbUDPJi50IP+8UdPkd49g8FHxfUyMOCD
 ACFdSAykcqUHpTbdvt0M4LWRIpfbYa5oqkLkm82oZB/SRE9J3+CcTQVk5PmOE3e7tUcU
 oOyhgPpc7z11fAi1jHnm7ChoodQXHJVavHHENkp0alV8am2wUKYKm+4tr0qA8cup/bhX
 L3R3KVpbVQHQ5tlpFCugZyT2QVH4qoXGDVkPc9eIU8MCygN/VOIn6FRBcTWykyf+m12i
 9/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773329324; x=1773934124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aoOSO/yJkuQuCs7i0xGJ+CSpNID0i7Y5EM4g6tQZvJ8=;
 b=v/OUngPOvPZvId/A677qpcaJgM5YlbDzSbwFu7Pdk1qGlAGe93k5Cj/ktyv4GywoLm
 XQgLHtj9B02o5JB9cEoDzb8Ti+Jua8pmH2clDk4phOkEVHCWhV7tDTY8GkWBvoF6bJMS
 VMAXWljuKiMPlD5BrjJayZ6Ic168QpF8e18d5jquo56QxrWoisMWZF7VM1nLNtcKvrRb
 MOQJRsjJdbgddcyekp1fowt8MBV7T5+NfwEnVzoLPuQUFW+72sv9Uz2K3+WUHu0Ivir0
 hF7VSnnSoOth1Htm5ntJTjWHvqFcKnaOT8NC8RHcdQ9GW/DRVL6sj/8PPs9GSQv6bfKS
 5JrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEqHi1V5PCeydcgdjEEQBUKahrwvVRSlxNX9QHMrQw6leubUXmb5hI8x3+CbTsbNtyhCH5zYCTXb/44uK4ejqT@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxcvfLZzwm+VzmrW6It3hWqJiNrDbwbVsbLut5f82gWMB+KK8JA
 6cgJjEOvLR5Ir2TIXQu+kbdTSE4i6Ryd8oFwRPGaibcUfCmMXrjT5wC6TksLED4e1Y8PbOUcADC
 Yxx0oIlNWL+IGC6ySti4v9fKA8gp5cnk=
X-Gm-Gg: ATEYQzxOgdIHIhUAMpKf51wE6D4vzSBJFbrX+CvlDwaIfVh0auKBREV9rfCZ0Ttn2Sq
 qVEF0NtKFDUjRo3ZuGC7ECtkuwKdlAhPVtqZZdJKZKH802HuE3h2gHdEMTrqy/221x5LdFSKq5Q
 dWpL8UOBkxqfh94H+dVbu0S5eHMajr8FYzHE1dZ8K5f+sG0BZtn4DitU3LVLBmBySUjltULhv5J
 RQ8KT4+UJRMBbilUaNwSL8c8Aw5GDXjF9V3sgI4rY3MAJesMDfO61CXhKJlRn29c4UbnZtiAHav
 yjwQFmIqMDAuc8yvPSdBo0A4P9lIimt4ymiYVbwZFKgJQdvekGFNfKnAJDcTTtrLWg==
X-Received: by 2002:a05:6102:374d:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-601def970b7mr2942618137.27.1773329324345; Thu, 12 Mar 2026
 08:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
 <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
In-Reply-To: <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 12 Mar 2026 08:28:33 -0700
X-Gm-Features: AaiRm50pXkkgr15lpwN5w6QyWQyW-X1-5yFLqZOJ_q5cYW6xpqvnMYY2Gkf_QdI
Message-ID: <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 12,
 2026 at 2:07 AM Chao Yu wrote: > > On 2026/3/12
 00:05, Daeho Jeong wrote: > > On Wed, Mar 11, 2026 at 6:44 AM Chao Yu wrote:
 > >> > >> On 2026/3/11 01:54, Daeho Jeong wrote: > >>> [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.43 listed in wl.mailspike.net]
X-Headers-End: 1w0hxy-0005rN-AA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: EE5F9274739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMjowN+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMTIgMDA6MDUsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjo0NOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI2LzMvMTEgMDE6NTQsIERhZWhvIEplb25nIHdyb3Rl
Ogo+ID4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+Pgo+
ID4+PiBJbiBhZ2UtYmFzZWQgdmljdGltIHNlbGVjdGlvbiAoQVRHQywgQVRfU1NSLCBvciBHQ19D
QiksIGYyZnNfZ2V0X3ZpY3RpbQo+ID4+PiBjYW4gZW5jb3VudGVyIHNlY3Rpb25zIHdpdGggemVy
byB2YWxpZCBibG9ja3MuIFRoaXMgc2l0dWF0aW9uIG9mdGVuCj4gPj4+IGFyaXNlcyB3aGVuIGNo
ZWNrcG9pbnQgaXMgZGlzYWJsZWQgb3IgZHVlIHRvIHJhY2UgY29uZGl0aW9ucyBiZXR3ZWVuCj4g
Pj4+IFNJVCB1cGRhdGVzIGFuZCBkaXJ0eSBsaXN0IG1hbmFnZW1lbnQuCj4gPj4+Cj4gPj4+IElu
IHN1Y2ggY2FzZXMsIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoKSByZXR1cm5zIElOVkFMSURfTVRJ
TUUsIHdoaWNoCj4gPj4+IHN1YnNlcXVlbnRseSB0cmlnZ2VycyBhIGZhdGFsIGYyZnNfYnVnX29u
KHNiaSwgbXRpbWUgPT0gSU5WQUxJRF9NVElNRSkKPiA+Pj4gaW4gYWRkX3ZpY3RpbV9lbnRyeSgp
IG9yIGdldF9jYl9jb3N0KCkuCj4gPj4+Cj4gPj4+IFRoaXMgcGF0Y2ggYWRkcyBhIGNoZWNrIGlu
IGYyZnNfZ2V0X3ZpY3RpbSdzIHNlbGVjdGlvbiBsb29wIHRvIHNraXAKPiA+Pj4gc2VjdGlvbnMg
d2l0aCBubyB2YWxpZCBibG9ja3MuIFRoaXMgcHJldmVudHMgdW5uZWNlc3NhcnkgYWdlCj4gPj4+
IGNhbGN1bGF0aW9ucyBmb3IgZW1wdHkgc2VjdGlvbnMgYW5kIGF2b2lkcyB0aGUgYXNzb2NpYXRl
ZCBrZXJuZWwgcGFuaWMuCj4gPj4+IFRoaXMgY2hhbmdlIGFsc28gYWxsb3dzIHJlbW92aW5nIHJl
ZHVuZGFudCBjaGVja3MgaW4gYWRkX3ZpY3RpbV9lbnRyeSgpLgo+ID4+Pgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+PiAtLS0KPiA+
Pj4gICAgZnMvZjJmcy9nYy5jIHwgOSArKystLS0tLS0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+ID4+PiBpbmRleCAyZTBmNjc5NDY5MTQuLjk4
MWVhYzYyOWZlOSAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4gPj4+ICsrKyBiL2Zz
L2YyZnMvZ2MuYwo+ID4+PiBAQCAtNTIxLDEyICs1MjEsNiBAQCBzdGF0aWMgdm9pZCBhZGRfdmlj
dGltX2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4gICAgICAgIHN0cnVjdCBz
aXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+ID4+PiAgICAgICAgdW5zaWduZWQgbG9uZyBs
b25nIG10aW1lID0gMDsKPiA+Pj4KPiA+Pj4gLSAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFn
X3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKSB7Cj4gPj4+IC0gICAgICAgICAgICAgaWYgKHAt
PmdjX21vZGUgPT0gR0NfQVQgJiYKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGdldF92YWxp
ZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkgPT0gMCkKPiA+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+Pj4gLSAgICAgfQo+ID4+PiAtCj4gPj4+ICAgICAgICBtdGltZSA9IGYy
ZnNfZ2V0X3NlY3Rpb25fbXRpbWUoc2JpLCBzZWdubyk7Cj4gPj4+ICAgICAgICBmMmZzX2J1Z19v
bihzYmksIG10aW1lID09IElOVkFMSURfTVRJTUUpOwo+ID4+Pgo+ID4+PiBAQCAtODg5LDYgKzg4
Myw5IEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNp
Z25lZCBpbnQgKnJlc3VsdCwKPiA+Pj4gICAgICAgICAgICAgICAgaWYgKHNlY191c2FnZV9jaGVj
ayhzYmksIHNlY25vKSkKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4g
Pj4+Cj4gPj4+ICsgICAgICAgICAgICAgaWYgKCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8s
IHRydWUpKQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4+Cj4gPj4g
V2VsbCwgZm9yIGYyZnNfZ2V0X3ZpY3RpbSgsIEFUX1NTUiksIG9uY2UgdGhlcmUgYXJlIG5vIGRp
cnR5IHNlZ21lbnQsIGlmIHdlCj4gPj4gZG9uJ3QgY291bnQgZnJlZSBzZWdtZW50IGFzIGNhbmRp
ZGF0ZXMsIHRoZW4sIHdlIGNhbiBub3QgZmluZCBhbnkgdmFsaWQgdmljdGltPwo+ID4KPiA+IE9o
LCBBVF9TU1IgbmVlZHMgdG8gc2VsZWN0IHRoZSBmcmVlIHNlY3Rpb24gaW4gdGhpcyBjYXNlPwo+
Cj4gSSB0aGluayBzbywgZm9yIGV4dHJlbWUgY2FzZS4KPgo+ID4gSSBhbSBjb25mdXNlZC4gV2h5
IGRvIHdlIG5lZWQgdGhlIGJlbG93IGxvZ2ljPwo+ID4gTG9va3MgbGlrZSBXQSBmb3IgdGhlIEFU
X1NTUiBjYXNlPwo+ID4KPiA+IEluIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoKQo+ID4gb3V0Ogo+
ID4gICAgICAgICAgaWYgKHVubGlrZWx5KG10aW1lID09IElOVkFMSURfTVRJTUUpKQo+ID4gICAg
ICAgICAgICAgICAgICBtdGltZSAtPSAxOwo+ID4gICAgICAgICAgcmV0dXJuIG10aW1lOwo+Cj4g
VGhlcmUgYXJlIHR3byBjb25kaXRpb25zLCBpbiBhIHNlY3Rpb246Cj4KPiBhKSBpZiB0aGVyZSBh
cmUgbm8gdmFsaWQgYmxvY2tzLCBpdCB3aWxsIHJldHVybiBJTlZBTElEX01USU1FLgo+IGIpIGlm
IHRoZXJlIGFyZSB2YWlsZCBibG9ja3MsIGl0IHRyaWVzIHRvIHJldHVybiBtdGltZSB3aGljaCBp
cyBjYWxjdWxhdGVkLCBidXQKPiBpZiB1bmx1Y2t5IHRoZSBjYWxjdWxhdGVkIG10aW1lIGlzIGVx
dWFsIHRvIElOVkFMSURfTVRJTUUsIGluIG9yZGVyIHRvIGRpc3Rpbmd1aXNoCj4gZnJvbSBjYXNl
IGEpLCB3ZSB3aWxsIHJldHVybiBJTlZBTElEX01USU1FIC0gMSBpbnN0ZWFkLgoKSWYgd2UgZmlu
ZCBhIGZyZWUgc2VnbWVudCBhbmQgcGFzcyBpdCB0byBmMmZzX2dldF9zZWN0aW9uX210aW1lKCkg
Zm9yCighX19pc19sYXJnZV9zZWN0aW9uKHNiaSkpIGNhc2UuCldoYXQgaXMgdGhlIGV4cGVjdGVk
IG91dHB1dCBvZiBpdD8gKElOVkFMSURfTVRJTUUgLSAxKT8KSSBkb24ndCB0aGluayB0aGlzIGlz
IGp1c3QgYW4gdW5sdWNreSBjYXNlLiBJcyB0aGlzIGV4cGVjdGVkIHJlc3VsdD8KCj4KPiBUaGFu
a3MsCj4KPiA+Cj4gPgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4gPj4+ICsKPiA+Pj4gICAgICAg
ICAgICAgICAgLyogRG9uJ3QgdG91Y2ggY2hlY2twb2ludGVkIGRhdGEgKi8KPiA+Pj4gICAgICAg
ICAgICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxF
RCkpKSB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHAuYWxsb2NfbW9kZSA9PSBM
RlMpIHsKPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
