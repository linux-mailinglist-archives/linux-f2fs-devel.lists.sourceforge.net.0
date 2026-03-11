Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM2XFeCSsWnkDAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:05:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EA266F5B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgyTUpVZ3rG0Kg5JG5o1LRkIHrsL6FuaiRs/ZKj3YaU=; b=ddzUs1MO0NGtZgoOwxWObRALjx
	wZmcPY7bPNw8Sy3m0M9zh2JLfkFNp7WBLli1xCcDBWPVaM371qIIEUpEywStTWXq1plp2kF9hjaX8
	NgUHpe7VeKSYBDUfMIe+2KU8/AYD6Dur+jwW0QikRJZgl2ZGPCDR1qR8KJNGqbTLrsdU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0M4B-0005xB-OJ;
	Wed, 11 Mar 2026 16:05:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w0M3u-0005wl-Pd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DjnkUEzn2InaeK7nwdLbScYbD64IewsiNV+cPaFHKeM=; b=lmFOQVb/tJu4V8H6zp9BJ6UYDg
 tW1HpuduK36hjfniG+72toe4/pYMTinqAQkSrMsgY5YSRgr13xkRZx77Xid20KOwDquyA4Uc4rSvG
 JZSAhP52weicT6ADkh2ZtwyL4gsn0FHKl5XoXBo/O4wv5fjWKZ/v8fK+DBCgnIj8qMDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DjnkUEzn2InaeK7nwdLbScYbD64IewsiNV+cPaFHKeM=; b=bp1vSSK0zRzPY/a6e0RuiOwWGO
 bN57/5TnKbwgkabS8BIXZUUjTdzOcmhoTu8PS41FcY1IfgArZRDWzVj/AZ3/xfaFOAtj9kdTVC/lu
 T6a37P7wH/mtj/XZ/V2LNGN4MHP2IxXUzmCUOzfPUTzeDd74qo3BP1Ighx0OAven4xrc=;
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0M3u-0007O3-DT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:05:30 +0000
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5ffc6a96665so17513137.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 09:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773245119; cv=none;
 d=google.com; s=arc-20240605;
 b=axMB5Eyj7Yg8Iwze0fng94meGoEdSsm7w0jYPQU+haMqprUvG+yeArSVpCNmVZTABG
 cfjahZMKdG37PuEm/Onmwdza2bVS1PHCjZMdcy1e0MWCCJSOWEPt4KIm9B/C/td0Us5e
 klluDxRXliNOkflqS1zAUwJlB/ToZPuRnZsKK8ICbWWFeVeWIgfMLdKl9equliT9daf4
 98syEg9zhP8CCssEaCU6EJpamqP6t+NfrusfZpv5aHThbJLPkZVTHMqbV8k3Ca7nYrch
 CPrf3UfZ38KsjpBtN2vmxV5zszdRQqR1+u6hqVUDXYgbOGOFO3+netQtjUmgM+f3lA9E
 Cu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DjnkUEzn2InaeK7nwdLbScYbD64IewsiNV+cPaFHKeM=;
 fh=zI+eB9QHhz8VYwq85RRKYLXUi+eGjo/peT1f/jbviho=;
 b=a0oWu/0GW/69Zh0Vuw+e4MhDh4pWqWNF6amstQrdCqpfzki6dwDka1jKxmjVA/ugzD
 WNdbbhYVO+dQ6cVsRYoA3KL/sNZfOF4imVz8z3UcU92ntiGHUuxOPr7pkYQF1+HmLZL3
 4lTvOE9delKiqRTlbGXSeFSjv6cKViExkft1pJ8VHCUU358AvZTShWsFZOviwH4tt8vQ
 6gJBobmB038KTe7BpALjdsNB18NI3aoOLHLEvZGadUYlsw4m/anCoy21zlY5Ds2yeLfY
 KgVvsCXjngPTYjGpO391qyI+k+ZVK0fts38oXHSVHlJXVbLdM3v3TydKkujWJBzPYkbz
 QDxQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773245119; x=1773849919; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjnkUEzn2InaeK7nwdLbScYbD64IewsiNV+cPaFHKeM=;
 b=WhTDPLUjJbWaUjcMySMlnOqUMiWO5xVaB2UjQVeMOOMntnT6SmpHcfISQ5VUMy3sTF
 0sCGduXJ2fpdXs14Qk8+66/nXQwIlLyXSQIwlxLVFZxGECTcGFm/1MbG8yKGle0wH6ge
 CwZPWr4afbbjFpowk+B2JipmXxjfQD81tyfxUEIPnw02ZL4txDq5V7QLLU/gANvnYngx
 eG9e7zva0od8jubcEmpYOVpwxhEjH4TQM2GYNEdhwpRph6fOis3TDxW9XxMZHEeoH8lt
 NNqp4l4puual4o8XqenWq+wrHnl/2KGNNB2N/YDsyP+jL7gQ5mZW36ddDfUjxZ2Ckw+F
 27Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773245119; x=1773849919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DjnkUEzn2InaeK7nwdLbScYbD64IewsiNV+cPaFHKeM=;
 b=Vga2tVPxiFVjLU1X/UgAc5EEsIbRXgxkv8bf67WVtDCd4spgoVVJs370xvJ90+014+
 wubWeaVQ6ovGRe2YqHZ759Rz9kU6ghUfntqL/CQb0l2mfBDY3Lnv5OV1Pi26MdprNUzX
 lompViazoRWKMziruG/J8HAfqoZnLl7dJYyxhO2/KWxhhs5RhqgxKk7S4S91djarpodX
 9o43c5Q9rfWbNDei9pOcb+loii+0jH7KRThSv+6eJ6GQK17SJadCwT5ybOqgy86rjmx1
 /4oXungQN7SP5K57a9/DskANIaCxi/6SYnK65molSVbxds3gbXsp0hBJDOSy4CmMFHDD
 e8Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3XhoNXN3ygfnhUCTUh4lJQpDB2BdIs/dtjHuNVEfYaudwCGvJH2jGFwaabR05+H5+XWEfiLazfyYKfvewcvw5@lists.sourceforge.net
X-Gm-Message-State: AOJu0YysU+DsPUJ7cayczMx2Pyd2PKNm19FROg+w6Db2GQ4ZgeqxCVqY
 uW+KDp8GOd+k2AmMCuA4/Tzuh1QJqhvYUcEYjwwxgum10IVLIwiTy+6DrZA8j2mTskkd57atLw6
 mE/duD+umj9Lfh1qmsDGu9LrtMZishhRrBRTZ
X-Gm-Gg: ATEYQzzYzvbfDNgXjbRXiYa6aUFEICieYSeAefVZe8H7xdDR8PgA7fh1NkPM9AN5+dZ
 eukiZm3MMc3YpqPZPlEDJo2S7sbAixrrA95DvYsUAqkh90vSTilmxYSmmj1Je/+jkXUVPhYQw67
 zQq94CAHnADOOEYYx7HzSVL94KWYLGJ91l75y2J0Q/epG9y3D1ntUgrRQ06yUsXC5sNmvGbakrm
 Wav/PKwLEHQjNxOmH0SxUNeK6H9Pea2G2EMLlDltFUsBceUegUlV9A/c2Vy4AiwHQY+gTxsPQIm
 yU7stjEnKzHotXxjZlLKJ7O1oW44tfzKCwXQKhtYOiTGomRIvNkf9/IsUZce+dwOtNWwMTEG
X-Received: by 2002:a05:6102:3f48:b0:5ef:aeff:8304 with SMTP id
 ada2fe7eead31-601df022230mr1217314137.33.1773245119057; Wed, 11 Mar 2026
 09:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
In-Reply-To: <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 11 Mar 2026 09:05:06 -0700
X-Gm-Features: AaiRm51pEcHapSLZS-Jj5dRAJjMbas39Xzk48ATiE8TbLHMDgwHRGKUsK-iHRZs
Message-ID: <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 11,
 2026 at 6:44 AM Chao Yu wrote: > > On 2026/3/11
 01:54, Daeho Jeong wrote: > > From: Daeho Jeong > > > > In age-based victim
 selection (ATGC, AT_SSR, or GC_CB), f2fs_get_victim > > [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.44 listed in wl.mailspike.net]
X-Headers-End: 1w0M3u-0007O3-DT
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
X-Rspamd-Queue-Id: A33EA266F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjo0NOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMTEgMDE6NTQsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
RnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBJbiBhZ2Ut
YmFzZWQgdmljdGltIHNlbGVjdGlvbiAoQVRHQywgQVRfU1NSLCBvciBHQ19DQiksIGYyZnNfZ2V0
X3ZpY3RpbQo+ID4gY2FuIGVuY291bnRlciBzZWN0aW9ucyB3aXRoIHplcm8gdmFsaWQgYmxvY2tz
LiBUaGlzIHNpdHVhdGlvbiBvZnRlbgo+ID4gYXJpc2VzIHdoZW4gY2hlY2twb2ludCBpcyBkaXNh
YmxlZCBvciBkdWUgdG8gcmFjZSBjb25kaXRpb25zIGJldHdlZW4KPiA+IFNJVCB1cGRhdGVzIGFu
ZCBkaXJ0eSBsaXN0IG1hbmFnZW1lbnQuCj4gPgo+ID4gSW4gc3VjaCBjYXNlcywgZjJmc19nZXRf
c2VjdGlvbl9tdGltZSgpIHJldHVybnMgSU5WQUxJRF9NVElNRSwgd2hpY2gKPiA+IHN1YnNlcXVl
bnRseSB0cmlnZ2VycyBhIGZhdGFsIGYyZnNfYnVnX29uKHNiaSwgbXRpbWUgPT0gSU5WQUxJRF9N
VElNRSkKPiA+IGluIGFkZF92aWN0aW1fZW50cnkoKSBvciBnZXRfY2JfY29zdCgpLgo+ID4KPiA+
IFRoaXMgcGF0Y2ggYWRkcyBhIGNoZWNrIGluIGYyZnNfZ2V0X3ZpY3RpbSdzIHNlbGVjdGlvbiBs
b29wIHRvIHNraXAKPiA+IHNlY3Rpb25zIHdpdGggbm8gdmFsaWQgYmxvY2tzLiBUaGlzIHByZXZl
bnRzIHVubmVjZXNzYXJ5IGFnZQo+ID4gY2FsY3VsYXRpb25zIGZvciBlbXB0eSBzZWN0aW9ucyBh
bmQgYXZvaWRzIHRoZSBhc3NvY2lhdGVkIGtlcm5lbCBwYW5pYy4KPiA+IFRoaXMgY2hhbmdlIGFs
c28gYWxsb3dzIHJlbW92aW5nIHJlZHVuZGFudCBjaGVja3MgaW4gYWRkX3ZpY3RpbV9lbnRyeSgp
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5j
b20+Cj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9nYy5jIHwgOSArKystLS0tLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4gPiBpbmRleCAyZTBmNjc5NDY5MTQu
Ljk4MWVhYzYyOWZlOSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ID4gKysrIGIvZnMv
ZjJmcy9nYy5jCj4gPiBAQCAtNTIxLDEyICs1MjEsNiBAQCBzdGF0aWMgdm9pZCBhZGRfdmljdGlt
X2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICAgIHN0cnVjdCBzaXRfaW5m
byAqc2l0X2kgPSBTSVRfSShzYmkpOwo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBsb25nIG10aW1l
ID0gMDsKPiA+Cj4gPiAtICAgICBpZiAodW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJ
X0NQX0RJU0FCTEVEKSkpIHsKPiA+IC0gICAgICAgICAgICAgaWYgKHAtPmdjX21vZGUgPT0gR0Nf
QVQgJiYKPiA+IC0gICAgICAgICAgICAgICAgICAgICBnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vn
bm8sIHRydWUpID09IDApCj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gLSAg
ICAgfQo+ID4gLQo+ID4gICAgICAgbXRpbWUgPSBmMmZzX2dldF9zZWN0aW9uX210aW1lKHNiaSwg
c2Vnbm8pOwo+ID4gICAgICAgZjJmc19idWdfb24oc2JpLCBtdGltZSA9PSBJTlZBTElEX01USU1F
KTsKPiA+Cj4gPiBAQCAtODg5LDYgKzg4Myw5IEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgKnJlc3VsdCwKPiA+ICAgICAgICAgICAg
ICAgaWYgKHNlY191c2FnZV9jaGVjayhzYmksIHNlY25vKSkKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIG5leHQ7Cj4gPgo+ID4gKyAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9j
a3Moc2JpLCBzZWdubywgdHJ1ZSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0
Owo+Cj4gV2VsbCwgZm9yIGYyZnNfZ2V0X3ZpY3RpbSgsIEFUX1NTUiksIG9uY2UgdGhlcmUgYXJl
IG5vIGRpcnR5IHNlZ21lbnQsIGlmIHdlCj4gZG9uJ3QgY291bnQgZnJlZSBzZWdtZW50IGFzIGNh
bmRpZGF0ZXMsIHRoZW4sIHdlIGNhbiBub3QgZmluZCBhbnkgdmFsaWQgdmljdGltPwoKT2gsIEFU
X1NTUiBuZWVkcyB0byBzZWxlY3QgdGhlIGZyZWUgc2VjdGlvbiBpbiB0aGlzIGNhc2U/CkkgYW0g
Y29uZnVzZWQuIFdoeSBkbyB3ZSBuZWVkIHRoZSBiZWxvdyBsb2dpYz8KTG9va3MgbGlrZSBXQSBm
b3IgdGhlIEFUX1NTUiBjYXNlPwoKSW4gZjJmc19nZXRfc2VjdGlvbl9tdGltZSgpCm91dDoKICAg
ICAgICBpZiAodW5saWtlbHkobXRpbWUgPT0gSU5WQUxJRF9NVElNRSkpCiAgICAgICAgICAgICAg
ICBtdGltZSAtPSAxOwogICAgICAgIHJldHVybiBtdGltZTsKCgo+Cj4gVGhhbmtzLAo+Cj4gPiAr
Cj4gPiAgICAgICAgICAgICAgIC8qIERvbid0IHRvdWNoIGNoZWNrcG9pbnRlZCBkYXRhICovCj4g
PiAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1Bf
RElTQUJMRUQpKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChwLmFsbG9jX21vZGUg
PT0gTEZTKSB7Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
