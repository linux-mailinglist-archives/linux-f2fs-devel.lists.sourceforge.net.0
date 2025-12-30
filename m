Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFB7CE9C91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 14:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeaNuH2bEan/UQU8sGjApJZMHee212MsXMXx4wHcmPU=; b=a98CAchei2GnM7TTj0au1alsU0
	9JJLXdjN5Cf71WRs3aCcuYTz06HcXZylRF3ZgdSj+tGM282Cij7SnDRqpQNTcOyDF/jPHzSiSOJLt
	eHDsn0b9VaPzwAXtsPUcV1c78x+pQ0evC9A5iOxpyZgTkNT7g6ipw9E1VwAQVXgn5l/k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaZjg-0002Cw-EX;
	Tue, 30 Dec 2025 13:26:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeuk20.kim@gmail.com>) id 1vaZjf-0002Cn-DS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 13:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z+S/7yAzOfWY95UqOaUD23OvyPe0W7m0t5JIL18uHak=; b=Vero2EqYLOpTsRcMj4no0UKebX
 DzjzQoZ6s5TrWQPXgqOpHRn3fzLAXzS9Z0PwQaiFaFrslqOaK/bz5J4IsVKs1iPzE2sT3svr3Ilvt
 Fw+GSY5ht16/UjcN/IfA5HNkt0PlJzziPnZGs4xCaZNj9rShStrxoh2/VxH6bKpxpUys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z+S/7yAzOfWY95UqOaUD23OvyPe0W7m0t5JIL18uHak=; b=l+OhX2lVuHfzfjWpYYMRLvup69
 Tu1X6qpezNz+FgKB2h28yKJuasDmeAHcOB7JMBuVvS2kx7hGSyQBcFvXhBUCuSGgcuGZGmea4UavR
 Z8JWi0i8MiAbk2tBJAu4GlCAtOTQ2xY4fHlU+fA/ax8RrfQKT/s+Icj9UluTxqYnQzbM=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vaZjf-00054c-IM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 13:26:04 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29f2676bb21so134310835ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Dec 2025 05:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767101153; x=1767705953; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+S/7yAzOfWY95UqOaUD23OvyPe0W7m0t5JIL18uHak=;
 b=Hpmmtz6Fpl/bweVZAcCnXMfHD8oHoQzgjNzFKAwAoMwyiXw/NoGQ7BhZdSrSbC+9lP
 D4DQFraI3ACsSVSPD+C4FFfvdFhI+7OikQlSv9RG8+Q59h+yUbzutMHlyhgL5T1Lmpgt
 wENaKyvdokmxY0AoY12yP4r1dzXsfNzc8h9vqfm6LzzYpdpnky01sLyhV+EzavxFEfMZ
 WDFRYp498qMgs1qUwjdc1wJ2110bCn06b/dXf4Q9E6XPXSzrRt0STSqdby4GYbNyF70g
 vrAOfvCsCLlRuVnOId/zYnLrdqhCDSzDqn/tw86LA8Q7Iljd8L19z3I3S/+xvDNSMLwC
 qphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767101153; x=1767705953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z+S/7yAzOfWY95UqOaUD23OvyPe0W7m0t5JIL18uHak=;
 b=rpUhxoWyBrA5uFPLKXDXaBQQvHv85XlNrfDWfs/0he+6UIRoY5aTqafmQz4vwMCTNh
 5Qbw5AWF5V9S8OJC9in3yPVEhazEfrHoKn3D7btRBDo0BPChrHVL91wYoSk0se+yxeeq
 zBVSW3Bq2QHJr/TAx6FdAM14z169yoSe/tQHfzrtcPHV/r5mN+BqcaFGkS9JiUcO7Ahq
 nafuUNy8f4q0zTB5gThJ65o5FxIUUT5ZmS1qaDpzfWWMHCI37DsRrkB36F/B1M//Z53j
 6F60WRMukz5k+XFX3zBJwl2YBp2o2eZ21/rVRy2ldOhJr+t5RZTndE0aQCTBMPhBjb2w
 ZWYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQJtFRWa6OM9hzByRlJxn484r5z3rylq86asVhB06Hljz1nTAtEa7RBPzLhuxaafF1pEdPFmXQJAw1QQQ3tUO2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwCKKK6luVG95QxUCE+ifQ/eESQgD0dcWsnz6KPYfwnwIB+GC+X
 3SAsK+N+dxbP9epXzzb0ShJfOVjWl8g3db2WbotqFmnvRf6J8ZlQ9WqM
X-Gm-Gg: AY/fxX6x2kqysA96SpDyP8B0ax1dVrVRmPdaFgk6jpeYDjsb4qSdQv05QIuhLsTaEDe
 ZM/gWGT4Gl/LjtN0SigH/03389GeSBki6a6Ld70aMxeNz36p3XUMST0egopfqthfqi5hrgbyobK
 SjMKnimzJ6haRTdaJuDQBglR2/ssjxq6UI7znl8jBU9zsdNjs4rAKJ1dQvNVm/FkpMBhdjO4rc/
 lHg1JHVEZ74wC5NnGXu3TJ4aleHB5ipWTVW+bEmjoH1OZammODyM1fxjucd6xuk3kpzSIRxdWpO
 n9+yAcW6bleqjdcUJ5jI9YV5ZJ3JB9kht2jZ0E0dmZ/7wGBfr2omVSYaaujW3ic07sB/27ZjTPz
 +E0UeVArE/J7lMuqsmjw/bs2IcSlT3HJJUKhfSWk/n6mjkykyNHJQNCq+ICqgPWoYBffO0ZbGW2
 b13yzQaSOOBdMQGCeMmC8zk0u+xyGicoblPVe01Ks=
X-Google-Smtp-Source: AGHT+IFXNm3C2mwrIpx1iDrEL4OT1TdN/7Fle+1ZWO16KKK6xi8KboIaQcFKaGeKRKJ+4h6ZQXZPpQ==
X-Received: by 2002:a17:902:eccb:b0:2a0:8358:88f8 with SMTP id
 d9443c01a7336-2a2f232c841mr331731235ad.22.1767101152774; 
 Tue, 30 Dec 2025 05:25:52 -0800 (PST)
Received: from [192.168.0.22] ([175.119.5.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c66465sm305743675ad.15.2025.12.30.05.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 05:25:51 -0800 (PST)
Message-ID: <2c1e9438-d7db-41ce-aad8-85cede2957d4@gmail.com>
Date: Tue, 30 Dec 2025 22:25:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ko
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <CAPjHTeSsvb7UOAn9mWoqXwWTw1J9SEEDo1k=8KVcAxwVsys+Og@mail.gmail.com>
 <c28020f1-e2f2-42e8-9c0c-0ff70ec219cd@kernel.org>
From: Jeuk Kim <jeuk20.kim@gmail.com>
In-Reply-To: <c28020f1-e2f2-42e8-9c0c-0ff70ec219cd@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/30/2025 6:27 PM, Chao Yu wrote: > Hi Jeuk, > > On 12/29/2025
    2:33 PM, Jeuk Kim wrote: >> Hi F2FS maintainers, >> >> Sorry for the duplicate
    — I’m resending this because the previous >> mess [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [jeuk20.kim(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.214.181 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vaZjf-00054c-IM
Subject: Re: [f2fs-dev] Question: batching block allocation in f2fs DIO path
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
 Jeuk Kim <jeuk20.kim@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDEyLzMwLzIwMjUgNjoyNyBQTSwgQ2hhbyBZdSB3cm90ZToKPiBIaSBKZXVrLAo+Cj4gT24g
MTIvMjkvMjAyNSAyOjMzIFBNLCBKZXVrIEtpbSB3cm90ZToKPj4gSGkgRjJGUyBtYWludGFpbmVy
cywKPj4KPj4gU29ycnkgZm9yIHRoZSBkdXBsaWNhdGUg4oCUIEnigJltIHJlc2VuZGluZyB0aGlz
IGJlY2F1c2UgdGhlIHByZXZpb3VzCj4+IG1lc3NhZ2Ugd2FzIHNlbnQgaW4gSFRNTCBmb3JtYXQu
Cj4+Cj4+IEnigJl2ZSBiZWVuIGxvb2tpbmcgaW50byB0aGUgRElPIGFsbG9jYXRpb24gcGF0aCBp
biBmMmZzLCBzcGVjaWZpY2FsbHkKPj4gd2hlbiBhIERJTyB3cml0ZSBuZWVkcyB0byBhbGxvY2F0
ZSBuZXcgYmxvY2tzIChlLmcuLCBob2xlLWZpbGxpbmcpLgo+PiDCoEZyb20gZjJmc19tYXBfYmxv
Y2tzKCkgdGhyb3VnaCBfX2FsbG9jYXRlX2RhdGFfYmxvY2soKSDihpIKPj4gZjJmc19hbGxvY2F0
ZV9kYXRhX2Jsb2NrKCksIGl0IHNlZW1zIGVhY2ggYmxvY2sgYWxsb2NhdGlvbiBpcyBoYW5kbGVk
Cj4+IG9uZS1ieS1vbmUsIHRha2luZyBjdXJzZWdfbG9jay9jdXJzZWdfbXV0ZXggYW5kIHRoZSBT
SVQgc2VudHJ5IGxvY2sKPj4gcGVyIGJsb2NrLgo+Pgo+PiBJ4oCZbSB3b25kZXJpbmcgd2hldGhl
ciBiYXRjaGluZyBhbGxvY2F0aW9ucyAoYSBib3VuZGVkIGJhdGNoLCBlLmcuLCBhCj4+IHNtYWxs
IHJ1biB3aXRoaW4gdGhlIGN1cnJlbnQgc2VnbWVudCkgY291bGQgYmUgZmVhc2libGUgaW4gdGhl
IERJTwo+PiBwYXRoLiBNeSBpbnR1aXRpb24gaXMgdGhhdCB3aXRoIG11bHRpcGxlIHRocmVhZHMg
ZG9pbmcgRElPLCByZWR1Y2luZwo+PiBwZXItYmxvY2sgbG9jayBjb250ZW50aW9uIGFuZCBpbXBy
b3Zpbmcgc2VxdWVudGlhbGl0eSBjb3VsZCBoZWxwCj4+IHRocm91Z2hwdXQuCj4KPiBJIGFncmVl
IHcvIHlvdS4KPgo+Pgo+PiBRdWVzdGlvbnM6Cj4+Cj4+IElzIHRoZXJlIGEgdGVjaG5pY2FsIG9y
IGNvcnJlY3RuZXNzIHJlYXNvbiB0aGF0IG1ha2VzIGJhdGNoaW5nIGZvciBESU8KPj4gaW5mZWFz
aWJsZSAoZS5nLiwgTEZTL1NTUi9HQyBpbnRlcmFjdGlvbnMsIHN1bW1hcnkvU0lUIHVwZGF0ZQo+
PiBvcmRlcmluZywgZXRjLik/Cj4+Cj4+IE9yIGlzIHRoaXMgc2ltcGx5IGFuIG9wdGltaXphdGlv
biB0aGF0IGhhc27igJl0IGJlZW4gaW1wbGVtZW50ZWQ/Cj4KPiBJJ3ZlIGltcGxlbWVudGVkIGEg
cHJvdG90eXBlIG9mIG11bHRpcGxlIGJsb2NrIGFsbG9jYXRpb24gZm9yIGFueSAKPiBwb3RlbnRp
YWwKPiB1c2UgY2FzZXM6IHBpbmZpbGUgZmFsbG9jYXRpb24sIGRpcmVjdCBJTyBhbmQgYnVmZmVy
ZWQgSU8uIEkgY2FuIHNlZSAKPiBiZW5lZml0cwo+IGZyb20gbXkgcHJldmlvdXMgdGVzdC4KPgo+
IEkgcGxhbiB0byB1cHN0cmVhbSBhbGwgaW1wbGVtZW50YXRpb25zLCBidXQgSSB0aGluayBJIG5l
ZWQgbW9yZSB0aW1lIAo+IHRvIGNsZWFuCj4gdXAgdGhlIGRyYWZ0IGNvZGVzIGFuZCBjaGVjayBh
bGwgY29ybmVyIGNhc2VzLgo+Cj4gWW91IGNhbiBjaGVjayB0aGUgTUJBIGltcGxlbWVudGF0aW9u
IGZvciBwaW5maWxlIHVzZSBjYXNlIGluIGJlbG93IAo+IGxpbmssIEkKPiBndWVzcyB0aGlzIHZl
cnNpb24gaXMgY2xvc2UgdG8gdXBzdHJlYW0uCj4KPiBodHRwczovL2dpdGh1Yi5jb20vY2hhc2V5
dS9mMmZzLWRldi9jb21taXRzL2ZlYXR1cmUvaW5iYXRjaF93cml0ZQo+Cj4gVGhhbmtzLAo+Cj4+
Cj4+IElmIHRoaXMgc2VlbXMgYWNjZXB0YWJsZSwgd291bGQgeW91IGNvbnNpZGVyIHBhdGNoZXMg
aW4gdGhpcyBkaXJlY3Rpb24/Cj4+Cj4+IElmIHRoZXJlIGFyZSBwcmlvciBkaXNjdXNzaW9ucyBv
ciBrbm93biBpc3N1ZXMgb24gdGhpcywgSeKAmWQgCj4+IGFwcHJlY2lhdGUgcG9pbnRlcnMuCj4+
Cj4+IFRoYW5rcyBmb3IgeW91ciB0aW1lLgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEpldWsgS2lt
Cj4KCkhpIENoYW8sCgpUaGFua3MgYSBsb3QgZm9yIHNoYXJpbmcgdGhpcyBhbmQgdGhlIGxpbmsu
CgpHb29kIHRvIGhlYXIgeW914oCZdmUgc2VlbiBiZW5lZml0cyBmcm9tIHRoZSBNQkEgcHJvdG90
eXBlLgoKSeKAmWxsIGxvb2sgaW50byB0aGUgcGluZmlsZSBpbXBsZW1lbnRhdGlvbiBhbmQgdHJ5
IHRlc3RpbmcgaXQgb24gbXkgc2lkZS4KClRoYW5rcywKSmV1awoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
