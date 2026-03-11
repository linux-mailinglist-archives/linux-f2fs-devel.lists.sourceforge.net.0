Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHRHE6iRsWnkDAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:00:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C44266E2D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtsSWkuJA1d5XI3WqbaHGLeUzoOt3sX14jBRDf/7rPQ=; b=e0hhn0eeAw3H+UuGjeVY+FI9FK
	2PUT/Njt4bEyGUWiVue3/aM/ZpMyLJisQbuHR0Pg4fD1vU5Nf4cT1JzeuHMftCt7cUpfxPQJkEaGr
	BPrcy5vOICdqRQnzXbzouhy3JdxKRfnoAwauGG1zB0lo472YZ/kb7SO5D8/fVpMAK3lg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0Lz0-0005oo-Vl;
	Wed, 11 Mar 2026 16:00:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w0Lyz-0005of-4H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N4RC9PyCzifwK0qfuR46ckQQT9Vj9kHV1AXgNsaKi/8=; b=GcUCXgL7dm6o3DhiG0SVP7PN90
 Alnl7ByXfEx7NzKCBtpq8AdP/nRwVF2borH2fe3rYhKtffne2f7I4iXgUY9YXmZs6EMg0vntM89o8
 hePNHdfDbZD4kmW6g8KCkSFHZizL4t1dqrjK5xo4aNVeNTsRH0VCmNAskF/T8mb/blPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N4RC9PyCzifwK0qfuR46ckQQT9Vj9kHV1AXgNsaKi/8=; b=GGQMtZfX3p+hKmcWUHjz7opVVl
 WXRawZL6q5Mbd21DY0SHBT/DI+nnKALbxyFMO2q5YmvZSSDtnzVugLubZMP3GFblKMjdWOI16ZkfY
 kKAqtrglA/43P5yGbgczREuLqthBEVDB2IXX1NlgPHVBxbe6KSJozZ/cwwf1jQPA7YEA=;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0Lyy-00075E-KI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:00:25 +0000
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-56aeaa75cadso30235e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 09:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773244814; cv=none;
 d=google.com; s=arc-20240605;
 b=fn9w6Zs+w62b1MKaVpD3OdYqeUC23KlFlNvHxGIlrGMLZZF3FvTxYVMzuaH5x6e6mm
 QlJoTIxq9R4PXpk0SKPvBV+SkLgMs/e5fzwS2MJW46p+aUg3t2rLKQqpREReRDM53nw9
 H2mZi+7rkweHjQgQ7shDkHxQMsxlqscwVQ5FPthD6MaB2t2dIiAKwwbKpTELzrh7nLTg
 eIu7sf7hvVtpfLCGgbxXGALiKQJTjpxWaRmgEWlBg6zP+7igl3CRyGZMoeq2OEMrzwdx
 pKuXhy4tj3nnR7Ce+mmvBab4zTikNAYGEXLUkm46mVCYX4o5LRigBFo9R+Dsb2YbW9bi
 uRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=N4RC9PyCzifwK0qfuR46ckQQT9Vj9kHV1AXgNsaKi/8=;
 fh=kUbavsMiFeHusDqeXQmgwxsbcfijIR4p1li1K2l6BT4=;
 b=CbT95JThl4bGrmXlsWh2k8rhSHn8gCSp0/dMZHczIMpyQoAeYG1kNC0vmnEMdT6bx1
 GcrikdIkC6LTkWJVzGSvqfEbYPfWdvq4jQE6vq2xx4sDyuYhTTZ1SM/QvczLTcV/qdNg
 G0TdXjc9BoO2FR5IiK01OxN6UwFR2l+kfkJoqPDOqkBO79fGnGChI+G1x3srV4qpc0Al
 IFtWjgLzvhxMxg42xrRytQFN8byF390oyWa1lPYpnYCKMa3smxcmWDVzo+MkGjMTapPY
 iCQDYTCeABjDbge7GpToi4x4X6++eRuE3neXTtwEbO2+uojwsltnp0z97x+GpjiMNYJA
 3zRg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773244814; x=1773849614; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4RC9PyCzifwK0qfuR46ckQQT9Vj9kHV1AXgNsaKi/8=;
 b=CM6iUQk1B/o7rH8fE3wI6MGpPPLNV44meBZlZgSG1qvWGUztlVPQCfuWKOwMcqKKof
 2fi8TqJuNXOwcT1L2NzkOp9ORC9zvFOu6lyvYqxUzBKLQgo+AlhmuNIZgdnuU/cuW3or
 I25Z2wdGz12oYK1XrYk8aivDZje3Q19wUTnvMjBoc2VPHLmQuT+IOLHVL98KcJ/fOMgk
 k9EFYoXHUw1l6pw/E81yMvk8sNp6pqHG+ztJzIl7b1WUQZhYhzGlDcklcykC420kUaVy
 sXUJw5W284j/7qCeO1DFy+Jy1JDb6QdwYznqA1CH7BQqOdTSYNX55XmVOTgfzy1lYbLc
 vggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773244814; x=1773849614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N4RC9PyCzifwK0qfuR46ckQQT9Vj9kHV1AXgNsaKi/8=;
 b=Lz70BUk0UH2Cf0mi3HuJHMYohZtjTCBMenYYXs3XxUoh04Fnf2wxFFikqNQQxPxNMg
 QiTtAErMtnNu29vHxn+QJAlXoMW8Y9WJwgdHGx9xNcGlGTtpOxbSURHUfrPVAbg7uRiN
 dartrklibIivQUsiLsMP1poPFbF99zUfmGJ87gFOywa0MEHHW5kR8weSuhG6uCZY99SB
 hDKzXL7trklWI6oDvl9oMuoRRFhv045fYv8ZJdW6pdWXRjV8SNzuKF1Ho9IhaG2HVS3Y
 fOXGfjm5IuVCEZe8gBj3BHrt4Ws7jpzjWoxqyVUkllgJyZTVk4wI5SqK3ThXTR0nsXEg
 Y77Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIj1WVGIc0UfSSxv8ouR/wwHVdSuMpC7qEnrw00dlvzsQqlsBK3uOA1T+u6qT1hR6b0g+8wll0hfu2/VPb258O@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7F/XD0dstLh+h9C3sqzdesg1z1HBU+LQU3n2/Mmb9Pv3UBWQW
 /0z/Is+6ELGOs8oW1PTv3NFV/u9JD2xsr4m/X7JccY0cf9vi+BPcny/eFreTHaZE7iioNO/z/9B
 fQkfiZI07Fckx9wmxfTWAZl96TXxx+oA=
X-Gm-Gg: ATEYQzxfX2H7hDFUBdjU6yvcBl1uOE6m0+23mU2QHwhMHqeEYYR8Ss2p+aRIjGrqJDw
 zDFOXhwnj03Osn0LdJAuLkeyFlQm7KcjWFRCf2Aan1/CZBlD5OdSmSjujgiZmRM8fwuWSg0avQy
 k5dmdaZls+BZ21DhiRf/cF0CbGx7Gc1F6ZWApNwD687CePw2oQPei3BhYFZBKeZDnC9mI7E6m85
 zRSGkBH3A8MM3vFrpL64Q1GSEi9OyDxw3ryKKBYtJYQfHazoBxZgZS614HUKgfCZS2QLBLxyk5u
 ju7iJ3tGEqOlEQkl0WU6nm8VmS7aTrcef4uuErBiGgz5B16tdkD+V2XRxQ4VfNFqeDI78j7T
X-Received: by 2002:a05:6122:2a15:b0:56a:9435:d865 with SMTP id
 71dfb90a1353d-56b4754c5dfmr961970e0c.14.1773244813588; Wed, 11 Mar 2026
 09:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260310204916.1265736-1-daeho43@gmail.com>
 <2ab52a8d-a21b-4b74-a2a1-d7b51fb60ca6@kernel.org>
In-Reply-To: <2ab52a8d-a21b-4b74-a2a1-d7b51fb60ca6@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 11 Mar 2026 09:00:02 -0700
X-Gm-Features: AaiRm51vv9vT2WP_cmoNCqPHCn4v7CN_SEgpTt9Stvjl--E-ALEFkbfLoP731gg
Message-ID: <CACOAw_z-vDFjp8mkBPaBvibDMbAmLBcisjUxu=8A5pqaKGEfEQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 11,
 2026 at 7:59 AM Chao Yu wrote: > > On 2026/3/11
 04:49, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Suspend can fail
 if kernel threads do not freeze for a while. > > f2fs_gc an [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.182 listed in wl.mailspike.net]
X-Headers-End: 1w0Lyy-00075E-KI
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to freeze GC and discard threads
 quickly
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
X-Rspamd-Queue-Id: D0C44266E2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNzo1OeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMTEgMDQ6NDksIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
RnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBTdXNwZW5k
IGNhbiBmYWlsIGlmIGtlcm5lbCB0aHJlYWRzIGRvIG5vdCBmcmVlemUgZm9yIGEgd2hpbGUuCj4g
PiBmMmZzX2djIGFuZCBmMmZzX2Rpc2NhcmQgdGhyZWFkcyBjYW4gcGVyZm9ybSBsb25nLXJ1bm5p
bmcgb3BlcmF0aW9ucwo+ID4gdGhhdCBwcmV2ZW50IHRoZW0gZnJvbSByZWFjaGluZyBhIGZyZWV6
ZSBwb2ludCBpbiBhIHRpbWVseSBtYW5uZXIuCj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRzIGV4cGxp
Y2l0IGZyZWV6aW5nIGNoZWNrcyBpbiB0aGUgZm9sbG93aW5nIGxvY2F0aW9uczoKPiA+IDEuIGYy
ZnNfZ2M6IEFkZGVkIGEgY2hlY2sgYXQgdGhlICdyZXRyeScgbGFiZWwgdG8gZXhpdCB0aGUgbG9v
cCBxdWlja2x5Cj4gPiAgICAgaWYgZnJlZXppbmcgaXMgcmVxdWVzdGVkLCBlc3BlY2lhbGx5IGR1
cmluZyBoZWF2eSBHQyByb3VuZHMuCj4gPiAyLiBfX2lzc3VlX2Rpc2NhcmRfY21kOiBBZGRlZCBh
ICdzdXNwZW5kZWQnIGZsYWcgdG8gYnJlYWsgYm90aCBpbm5lciBhbmQKPiA+ICAgICBvdXRlciBs
b29wcyBkdXJpbmcgZGlzY2FyZCBjb21tYW5kIGlzc3VhbmNlIGlmIGZyZWV6aW5nIGlzIGRldGVj
dGVkCj4gPiAgICAgYWZ0ZXIgYXQgbGVhc3Qgb25lIGNvbW1hbmQgaGFzIGJlZW4gaXNzdWVkLgo+
ID4gMy4gX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5OiBBZGRlZCBhIHNpbWlsYXIgY2hlY2sg
Zm9yIG9yZGVybHkgZGlzY2FyZAo+ID4gICAgIHRvIGVuc3VyZSByZXNwb25zaXZlbmVzcy4KPiA+
Cj4gPiBUaGVzZSBjaGVja3MgZW5zdXJlIHRoYXQgdGhlIHRocmVhZHMgcmVsZWFzZSBsb2NrcyBz
YWZlbHkgYW5kIGVudGVyIHRoZQo+ID4gZnJvemVuIHN0YXRlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICAgZnMv
ZjJmcy9nYy5jICAgICAgfCAgNCArKysrCj4gPiAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTQgKysr
KysrKysrKysrLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2dj
LmMKPiA+IGluZGV4IDk4MWVhYzYyOWZlOS4uZmRjMzM2NmM0ZGIzIDEwMDY0NAo+ID4gLS0tIGEv
ZnMvZjJmcy9nYy5jCj4gPiArKysgYi9mcy9mMmZzL2djLmMKPiA+IEBAIC0xOTYyLDYgKzE5NjIs
MTAgQEAgaW50IGYyZnNfZ2Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgZjJmc19n
Y19jb250cm9sICpnY19jb250cm9sKQo+ID4gICAgICAgICAgICAgICBnb3RvIHN0b3A7Cj4gPiAg
ICAgICB9Cj4gPiAgIHJldHJ5Ogo+ID4gKyAgICAgaWYgKHVubGlrZWx5KGZyZWV6aW5nKGN1cnJl
bnQpKSkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSAwOwo+ID4gKyAgICAgICAgICAgICBnb3Rv
IHN0b3A7Cj4gPiArICAgICB9Cj4KPiBEbyB3ZSBuZWVkIHRvIGNoZWNrIGZyZWV6aW5nKCkgZHVy
aW5nIG11bHRpcGxlIHNlZ21lbnRzIG1pZ3JhdGlvbj8KPiBlc3BlY2lhbGx5IGluIGxhcmdlIHNl
Y3Rpb24sIGUuZy4genVmcyBjYXNlLgoKT3RoZXJ3aXNlLCB3ZSBjYW4ndCBtZWV0IHRoZSAxIHNl
Y29uZCBzdXNwZW5kIHJlcXVpcmVtZW50IGZvciBBbmRyb2lkLgpUaGlzIGxvZ2ljIG1haW5seSB0
YXJnZXRzIHp1ZnMgcHJvYWN0aXZlIEdDIGNhc2VzLgpQbHVzLCBhcmVuJ3QgdGhlIHJlbWFpbmlu
ZyBzZWdtZW50cyBpbiB0aGUgc2VjdGlvbiB0aGUgbmV4dCB2aWN0aW1zIG9mCkdDIGZvciB0aGUg
bmV4dCByb3VuZD8KCj4KPiA+ICAgICAgIHJldCA9IF9fZ2V0X3ZpY3RpbShzYmksICZzZWdubywg
Z2NfdHlwZSwgZ2NfY29udHJvbC0+b25lX3RpbWUpOwo+ID4gICAgICAgaWYgKHJldCkgewo+ID4g
ICAgICAgICAgICAgICAvKiBhbGxvdyB0byBzZWFyY2ggdmljdGltIGZyb20gc2VjdGlvbnMgaGFz
IHBpbm5lZCBkYXRhICovCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9m
MmZzL3NlZ21lbnQuYwo+ID4gaW5kZXggZTliNmQ3NzRiOTg1Li5hNmM4MmFiMjgyODggMTAwNjQ0
Cj4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMK
PiA+IEBAIC0xNjA2LDYgKzE2MDYsOSBAQCBzdGF0aWMgdm9pZCBfX2lzc3VlX2Rpc2NhcmRfY21k
X29yZGVybHkoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICBpZiAo
ZGMtPnN0YXRlICE9IERfUFJFUCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7
Cj4gPgo+ID4gKyAgICAgICAgICAgICBpZiAoKmlzc3VlZCA+IDAgJiYgdW5saWtlbHkoZnJlZXpp
bmcoY3VycmVudCkpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4g
ICAgICAgICAgICAgICBpZiAoZHBvbGljeS0+aW9fYXdhcmUgJiYgIWlzX2lkbGUoc2JpLCBESVND
QVJEX1RJTUUpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW9faW50ZXJydXB0ZWQgPSB0
cnVlOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gQEAgLTE2NDUsNiArMTY0
OCw3IEBAIHN0YXRpYyBpbnQgX19pc3N1ZV9kaXNjYXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4gPiAgICAgICBzdHJ1Y3QgYmxrX3BsdWcgcGx1ZzsKPiA+ICAgICAgIGludCBpLCBp
c3N1ZWQ7Cj4gPiAgICAgICBib29sIGlvX2ludGVycnVwdGVkID0gZmFsc2U7Cj4gPiArICAgICBi
b29sIHN1c3BlbmRlZCA9IGZhbHNlOwo+ID4KPiA+ICAgICAgIGlmIChkcG9saWN5LT50aW1lb3V0
KQo+ID4gICAgICAgICAgICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgVU1PVU5UX0RJU0NBUkRf
VElNRU9VVCk7Cj4gPiBAQCAtMTY3NSw2ICsxNjc5LDExIEBAIHN0YXRpYyBpbnQgX19pc3N1ZV9k
aXNjYXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiAgICAgICAgICAgICAgIGxp
c3RfZm9yX2VhY2hfZW50cnlfc2FmZShkYywgdG1wLCBwZW5kX2xpc3QsIGxpc3QpIHsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIGRjLT5zdGF0ZSAhPSBEX1BSRVAp
Owo+ID4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoaXNzdWVkID4gMCAmJiB1bmxpa2Vs
eShmcmVlemluZyhjdXJyZW50KSkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN1c3BlbmRlZCA9IHRydWU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGRwb2xpY3ktPnRpbWVvdXQgJiYKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfdGltZV9vdmVyKHNiaSwgVU1PVU5UX0RJU0NBUkRfVElNRU9VVCkpCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+IEBAIC0xNjk0LDExICsxNzAz
LDEyIEBAIHN0YXRpYyBpbnQgX19pc3N1ZV9kaXNjYXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4gPiAgIG5leHQ6Cj4gPiAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmZGNjLT5j
bWRfbG9jayk7Cj4gPgo+ID4gLSAgICAgICAgICAgICBpZiAoaXNzdWVkID49IGRwb2xpY3ktPm1h
eF9yZXF1ZXN0cyB8fCBpb19pbnRlcnJ1cHRlZCkKPiA+ICsgICAgICAgICAgICAgaWYgKGlzc3Vl
ZCA+PSBkcG9saWN5LT5tYXhfcmVxdWVzdHMgfHwgaW9faW50ZXJydXB0ZWQgfHwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3VzcGVuZGVkKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIGlmIChkcG9saWN5
LT50eXBlID09IERQT0xJQ1lfVU1PVU5UICYmIGlzc3VlZCkgewo+ID4gKyAgICAgaWYgKGRwb2xp
Y3ktPnR5cGUgPT0gRFBPTElDWV9VTU9VTlQgJiYgaXNzdWVkICYmICFzdXNwZW5kZWQpIHsKPgo+
IElmIHdlJ3JlIHVtb3VudGluZyBkYXRhIHBhcnRpdGlvbiwgaXQgZG9lc24ndCBuZWVkIHRvIGNv
bnNpZGVyIHN1c3BlbmQ/CgpNYWtlcyBzZW5zZS4KCj4KPiBUaGFua3MsCj4KPiA+ICAgICAgICAg
ICAgICAgX193YWl0X2FsbF9kaXNjYXJkX2NtZChzYmksIGRwb2xpY3kpOwo+ID4gICAgICAgICAg
ICAgICBnb3RvIHJldHJ5Owo+ID4gICAgICAgfQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
