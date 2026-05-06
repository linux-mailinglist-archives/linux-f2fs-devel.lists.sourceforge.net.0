Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNdjO+5G+2lPYgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 06 May 2026 15:49:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 264174DB521
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 06 May 2026 15:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz3N+YLLWjH0qngQxL4Gp8z6CdVVfzUYGNwFiwGzgG4=; b=jL+H6lwtTfivR+PFZDirAsOEjE
	8khPk6mj1hZuc0LJR5uenPb9pE/arioO0MCu69r50f8C+Lsh9Ko46H7xNzzhpUthL6tsvzrzvt7nW
	AFjeAoNcQYHNgr8evzI3+a85RiZ/z30TqwXXLrhOi/otMiX1vyJ9DjsbpaX5XosMdAcQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKccv-0004jO-J4;
	Wed, 06 May 2026 13:49:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1wKcct-0004jF-Qm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 May 2026 13:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WuawnU3pCzvIese31bSRqbVeaZ/qbSTdUVR7BKQTGVk=; b=JJe4FoAnaKh+02dq4FGFPDHE7P
 8mofY7xRarPrp75US8ZBZrsgsZSpUZLNLpHLp10qaem+SbjvafI4VJwSOqaVbXPC8zlVTAhB8Ezq9
 Xtil8r88wrTt4X0xI5aM85p1v0FsQgnHrvYdiviRGHMuOcs2Rwvnr3ShBgL6hLQoKLkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WuawnU3pCzvIese31bSRqbVeaZ/qbSTdUVR7BKQTGVk=; b=gibwVR61a2VKtGJgOCjZV95AOw
 miqdyCXRPOJCYAz0nnAZdNpU3IYZ+TgP/vXcITxF2o0wotZh2huIzdJBgSPOtki7xkhKyxohUYb22
 aommx8F/JZP1kAlI6xiyR74kqlov5zmoT1qPaYHyCEKnC30vq5Ilk0vDAaQqNveRZQv0=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wKccq-0006Dh-08 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 May 2026 13:49:21 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2ba21d32776so24451485ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 May 2026 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778075349; x=1778680149; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WuawnU3pCzvIese31bSRqbVeaZ/qbSTdUVR7BKQTGVk=;
 b=U2NoMAHzlYK3yykPJ+atWAPvUTuxPLqOMTwd9kqRCAMmc7vhvBezbEYYCLzXJShXCj
 UeM/mHu+uYgndb8W33oz8vg8e8z8LnDrKXpV5ztdQX2nES1nXEk7nKHccgCcruga3Jrx
 pdxsmkKgiV1gLr6TRR4l/SMKIqu53B4nzbYqNT3djmKHhAz1+7iQUNG71wxF4XIgsW3o
 efEual/MSlOAs8DtE6CgoRGJ4xK4OXtJSEhZe3hAJxwNRfgb6iy5ZWZiMLrTndN2avu+
 kUj1SJlwqwJG2MAZpHL5MWor4gxBsBIUV3NcqZKiz/gLGS0Dhx7mZh/ZpfeKTmQEbuRC
 NocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778075349; x=1778680149;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WuawnU3pCzvIese31bSRqbVeaZ/qbSTdUVR7BKQTGVk=;
 b=YOujKR2ru42mYWgP04nnUjjJJK4xvT6Sq61ID7QftzYOOGny5vw1V6/HvBJ7RJeh2g
 D3CyRL8Fh/yh0y3zOPfRC9UORoSIX+YVbjrQLWimRTzK6w1N0MUYNOqnFBWhjJaw4Nzc
 /FpTtqx+QXwPOpJz0XrARdpka4uALHHzQ391qdTc5PPpH0l1j4VhSDzbfzhxR6yyRv5n
 XEZO8mCdCttxNqVdS+S+inYl0AxiCRP6sZFdrvOoeOztwWjzvrfn+aZex9YpZQwBQqAp
 NCbr4TGL80gJ1SWytN+4Ny3G4ZCg+5vtFkCGlnHnwQMOYbcGl9yes51xKcfWOcwM8V/o
 6EUg==
X-Gm-Message-State: AOJu0YzwldDis9YhCQ+5QOvpOktLYDjI7LM8UwLc66y/fkUiXN21cJuW
 Sgkgc4ed7povz4FU1p1tT1VXPsuupfSTM51/UTwooRIWVjzd9HuLk9jpvj0G5A==
X-Gm-Gg: AeBDietYZuzHk7bldaToMYbW6O8epzWk1zyLNCtF0I3X1B8ZOOCUGzwGmeh316mneB/
 upS0qDMGVdmwhRQEA2JxSd8hJhYt+0rksx99lDkvCXOhsNw61/cw7dNKkXo7g78DgOq5FpR5uPJ
 1UYXt+J5IApJHkjgzqu9qXNFvEu+dtM6uLdXwrnEsbViRGXQMHD/0eIt9Xk71Szx3onvtRtKcA4
 UolUHZAu3jK960uyiaABWymGCoaMf5ELCGudi4z58k4Big2s1KBYLD2UQFpGME7mDQak091pdzg
 3yDdEXRpCNrAqWlb/t862i7vjZ1HGJsoSQE8A83CF+sF+VKLoyVuJdZdSoBnw/3go2Mm6HzuuxL
 K2xvvEXCC6QKQk8jh7Stuw1lQgUnIw0N62sNe+SQP9SHVpKZTpQG/MhsNY9Ople9zmCX1KxNN2d
 YCDtZ3I7Lto7Ipn6NQrsDKN/N+1rxD14GZMgSI0tU53g+lapDJ+pqrk8c5y5JDQit/caAq+gKJ0
 qms2iQ=
X-Received: by 2002:a17:902:7605:b0:2b9:e765:e09a with SMTP id
 d9443c01a7336-2ba798a5c94mr24612625ad.37.1778075349088; 
 Wed, 06 May 2026 06:49:09 -0700 (PDT)
Received: from ?IPV6:2408:8607:1b00:8:1b22:7c63:cb98:af2e?
 ([2408:8607:1b00:8:1b22:7c63:cb98:af2e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ba7bf330a0sm26923155ad.31.2026.05.06.06.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:49:08 -0700 (PDT)
Message-ID: <e029962f-050b-4900-aa9e-4529d775fc31@gmail.com>
Date: Wed, 6 May 2026 21:49:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260423034223.1369837-1-jinbaoliu365@gmail.com>
 <76c97aef-7c28-4d50-887b-4624d7b2c1ba@kernel.org>
Content-Language: en-US
From: liujinbao1 <jinbaoliu365@gmail.com>
In-Reply-To: <76c97aef-7c28-4d50-887b-4624d7b2c1ba@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2026/4/29 15:44, Chao Yu 写道: > On 4/23/26 11:42,
   liujinbao1 wrote: >> From: liujinbao1 >> >> F2FS did not collect iostat statistics
    for direct IO reads and writes, >> hook submit_io to bind [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [jinbaoliu365(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [jinbaoliu365(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.214.182 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wKccq-0006Dh-08
Subject: Re: [f2fs-dev] [PATCH] f2fs: add iostat tracking for direct IO
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
Cc: shengyong1 <shengyong1@xiaomi.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 264174DB521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5]

CuWcqCAyMDI2LzQvMjkgMTU6NDQsIENoYW8gWXUg5YaZ6YGTOgo+IE9uIDQvMjMvMjYgMTE6NDIs
IGxpdWppbmJhbzEgd3JvdGU6Cj4+IEZyb206IGxpdWppbmJhbzEgPGxpdWppbmJhbzFAeGlhb21p
LmNvbT4KPj4KPj4gRjJGUyBkaWQgbm90IGNvbGxlY3QgaW9zdGF0IHN0YXRpc3RpY3MgZm9yIGRp
cmVjdCBJTyByZWFkcyBhbmQgd3JpdGVzLAo+PiBob29rIHN1Ym1pdF9pbyB0byBiaW5kIGFuIGlv
c3RhdCBjb250ZXh0IGFuZCByZWNvcmQgdGhlIHN1Ym1pc3Npb24KPj4gdGltZXN0YW1wLCByZXBs
YWNlIGJpX2VuZF9pbyB0byBjb2xsZWN0IElPIGxhdGVuY3kgb24gY29tcGxldGlvbiBhbmQKPj4g
dGhlbiBjYWxsIGJhY2sgdG8gdGhlIG9yaWdpbmFsIGlvbWFwX2Rpb19iaW9fZW5kX2lvKCksIHRv
IGFkZCBpb3N0YXQKPj4gdHJhY2tpbmcgc3VwcG9ydCBmb3IgRjJGUyBESU8uCj4KPiBOb3Qgc3Vy
ZSwgZG8gd2UgbmVlZCB0byBkaXN0aW5ndWlzaCB0aGUgbGF0ZW5jeSBvZiBESU8gZnJvbSBidWZm
ZXJlZCBJTz8KPgpXZSBkb24ndCBuZWVkIHRvIGRpc3Rpbmd1aXNoIERJTyBsYXRlbmN5IGZyb20g
YnVmZmVyZWQgSU8uIFRoZSBsYXRlbmN5IAppcyBtZWFzdXJlZCBmcm9tCgpiaW8gc3VibWl0IHRv
IGVuZF9pbywgc28gdGhlcmUgc2hvdWxkIGJlIGxpdHRsZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
bS4gCkkgd2lsbCBjb3JyZWN0IGNvbW1pdC4KCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBzaGVuZ3lv
bmcxIDxzaGVuZ3lvbmcxQHhpYW9taS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IGxpdWppbmJhbzEg
PGxpdWppbmJhbzFAeGlhb21pLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvZmlsZS5jwqDCoCB8
IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCBmcy9mMmZzL2lvc3RhdC5jIHzC
oCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+
PiBpbmRleCAyYzQ4ODBmMjRiNTQuLmZjZjcyNTkzMWZkOCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJm
cy9maWxlLmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4gQEAgLTQ3NzQsNiArNDc3NCwxNiBA
QCBzdGF0aWMgYm9vbCBmMmZzX3Nob3VsZF91c2VfZGlvKHN0cnVjdCBpbm9kZSAKPj4gKmlub2Rl
LCBzdHJ1Y3Qga2lvY2IgKmlvY2IsCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+IMKgIH0K
Pj4gwqAgK3N0YXRpYyB2b2lkIGYyZnNfZGlvX2VuZF9iaW8oc3RydWN0IGJpbyAqYmlvKQo+PiAr
ewo+PiArwqDCoMKgIHN0cnVjdCBiaW9faW9zdGF0X2N0eCAqaW9zdGF0X2N0eCA9IGJpby0+Ymlf
cHJpdmF0ZTsKPj4gK8KgwqDCoCB2b2lkICpvcmlnX2JpX3ByaXZhdGUgPSBpb3N0YXRfY3R4LT5w
b3N0X3JlYWRfY3R4Owo+PiArCj4+ICvCoMKgwqAgaW9zdGF0X3VwZGF0ZV9hbmRfdW5iaW5kX2N0
eChiaW8pOwo+PiArwqDCoMKgIGJpby0+YmlfcHJpdmF0ZSA9IG9yaWdfYmlfcHJpdmF0ZTsKPj4g
K8KgwqDCoCBpb21hcF9kaW9fYmlvX2VuZF9pbyhiaW8pOwo+PiArfQo+PiArCj4+IMKgIHN0YXRp
YyBpbnQgZjJmc19kaW9fcmVhZF9lbmRfaW8oc3RydWN0IGtpb2NiICppb2NiLCBzc2l6ZV90IHNp
emUsIAo+PiBpbnQgZXJyb3IsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dW5zaWduZWQgaW50IGZsYWdzKQo+PiDCoCB7Cj4+IEBAIC00Nzg2LDggKzQ3OTYsMjEgQEAgc3Rh
dGljIGludCBmMmZzX2Rpb19yZWFkX2VuZF9pbyhzdHJ1Y3Qga2lvY2IgCj4+ICppb2NiLCBzc2l6
ZV90IHNpemUsIGludCBlcnJvciwKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDC
oCArc3RhdGljIHZvaWQgZjJmc19kaW9fcmVhZF9zdWJtaXRfaW8oY29uc3Qgc3RydWN0IGlvbWFw
X2l0ZXIgKml0ZXIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgYmlvICpiaW8sIGxvZmZfdCBmaWxlX29mZnNldCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaXRlci0+aW5vZGUpOwo+PiArwqDCoMKg
IHZvaWQgKmJpX3ByaXZhdGUgPSBiaW8tPmJpX3ByaXZhdGU7Cj4+ICsKPj4gK8KgwqDCoCBpb3N0
YXRfYWxsb2NfYW5kX2JpbmRfY3R4KHNiaSwgYmlvLCBiaV9wcml2YXRlKTsKPj4gK8KgwqDCoCBp
b3N0YXRfdXBkYXRlX3N1Ym1pdF9jdHgoYmlvLCBEQVRBKTsKPj4gK8KgwqDCoCBiaW8tPmJpX2Vu
ZF9pbyA9IGYyZnNfZGlvX2VuZF9iaW87Cj4+ICvCoMKgwqAgYmxrX2NyeXB0b19zdWJtaXRfYmlv
KGJpbyk7Cj4+ICt9Cj4+ICsKPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBpb21hcF9kaW9fb3Bz
IGYyZnNfaW9tYXBfZGlvX3JlYWRfb3BzID0gewo+PiDCoMKgwqDCoMKgIC5lbmRfaW8gPSBmMmZz
X2Rpb19yZWFkX2VuZF9pbywKPj4gK8KgwqDCoCAuc3VibWl0X2lvID0gZjJmc19kaW9fcmVhZF9z
dWJtaXRfaW8sCj4+IMKgIH07Cj4+IMKgIMKgIHN0YXRpYyBzc2l6ZV90IGYyZnNfZGlvX3JlYWRf
aXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCAKPj4gaW92X2l0ZXIgKnRvKQo+PiBAQCAt
NTA2NCw4ICs1MDg3LDEyIEBAIHN0YXRpYyB2b2lkIGYyZnNfZGlvX3dyaXRlX3N1Ym1pdF9pbyhj
b25zdCAKPj4gc3RydWN0IGlvbWFwX2l0ZXIgKml0ZXIsCj4+IMKgwqDCoMKgwqAgc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPj4gwqDCoMKgwqDCoCBlbnVtIGxv
Z190eXBlIHR5cGUgPSBmMmZzX3J3X2hpbnRfdG9fc2VnX3R5cGUoc2JpLCAKPj4gaW5vZGUtPmlf
d3JpdGVfaGludCk7Cj4+IMKgwqDCoMKgwqAgZW51bSB0ZW1wX3R5cGUgdGVtcCA9IGYyZnNfZ2V0
X3NlZ21lbnRfdGVtcChzYmksIHR5cGUpOwo+PiArwqDCoMKgIHZvaWQgKmJpX3ByaXZhdGUgPSBi
aW8tPmJpX3ByaXZhdGU7Cj4+IMKgIMKgwqDCoMKgwqAgYmlvLT5iaV93cml0ZV9oaW50ID0gZjJm
c19pb190eXBlX3RvX3J3X2hpbnQoc2JpLCBEQVRBLCB0ZW1wKTsKPj4gK8KgwqDCoCBpb3N0YXRf
YWxsb2NfYW5kX2JpbmRfY3R4KHNiaSwgYmlvLCBiaV9wcml2YXRlKTsKPj4gK8KgwqDCoCBpb3N0
YXRfdXBkYXRlX3N1Ym1pdF9jdHgoYmlvLCBEQVRBKTsKPj4gK8KgwqDCoCBiaW8tPmJpX2VuZF9p
byA9IGYyZnNfZGlvX2VuZF9iaW87Cj4+IMKgwqDCoMKgwqAgYmxrX2NyeXB0b19zdWJtaXRfYmlv
KGJpbyk7Cj4KPiBUaGVyZSBhcmUgZHVwbGljYXRlZCBjb2RlcyBpbiBmMmZzX2Rpb193cml0ZV9z
dWJtaXRfaW8oKSBhbmQgCj4gZjJmc19kaW9fcmVhZF9zdWJtaXRfaW8oKSwKPiBjYW4gd2UgaW50
cm9kdWNlIGEgY29tbW9uIGZ1bmN0aW9uIHRvIHdyYXAgdGhvc2UgY29kZXM/Ck9L77yMdGhhbmtz
Cj4KPiBUaGFua3MsCj4KPj4gwqAgfQo+PiDCoCBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pb3N0YXQu
YyBiL2ZzL2YyZnMvaW9zdGF0LmMKPj4gaW5kZXggZjg3MDMwMzhlMWQ4Li41N2QyYzNlNjhhMWIg
MTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvaW9zdGF0LmMKPj4gKysrIGIvZnMvZjJmcy9pb3N0YXQu
Ywo+PiBAQCAtMjE4LDcgKzIxOCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3VwZGF0ZV9pb3N0
YXRfbGF0ZW5jeShzdHJ1Y3QgCj4+IGJpb19pb3N0YXRfY3R4ICppb3N0YXRfY3R4LAo+PiDCoMKg
wqDCoMKgIHN0cnVjdCBpb3N0YXRfbGF0X2luZm8gKmlvX2xhdCA9IHNiaS0+aW9zdGF0X2lvX2xh
dDsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiDCoCAtwqDCoMKgIGlmICgh
c2JpLT5pb3N0YXRfZW5hYmxlKQo+PiArwqDCoMKgIGlmICghc2JpLT5pb3N0YXRfZW5hYmxlIHx8
IGlvc3RhdF9jdHgtPnN1Ym1pdF90cyA9PSAwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+PiDCoCDCoMKgwqDCoMKgIHRzX2RpZmYgPSBqaWZmaWVzIC0gaW9zdGF0X2N0eC0+c3VibWl0
X3RzOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
