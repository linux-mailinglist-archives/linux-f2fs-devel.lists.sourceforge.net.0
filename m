Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C744B1E1C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 07:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crMH/DBg51ztOpw8TWJVRuAfdBWDnNrmEp/CQB0G+B4=; b=hDF3UK+CaOu4aL2ngsKZHnv/QJ
	fjzkeY49T9nDWqwKVwfdy7MSaYpOLjZB8Ge1sygwRcwMIdr1H4+ntSPf6WwMwh6KMygz53utTLhCw
	CqYKNAQYWrv2Ga253wU/1i6fLcPMJGJsV8ir9JNMvPrXmI0wxjaUAZkpFU6z6axhs+A4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukFnl-0002Ah-W1;
	Fri, 08 Aug 2025 05:38:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1ukFnl-0002AR-4q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 05:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uzN4MoggtOmzsOzNgRPBqPhMD4mrevOZONgYLvGdZVw=; b=ix0ZpEy/rAcC6q170WcBcT8qbI
 MF6viQW0F7Na/EDbsw/RsdzmRmHvuK23eYzTi/tkSqx0ecQouTk4wAAht4yGQKPmYvdy6ZC3lzUvo
 lUpxxX+Da6/cNziMUDItKz4AeDXAKZAmJqo88ICFk3b0YwNxQSXWUZJ6IlCqSdCDHGBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uzN4MoggtOmzsOzNgRPBqPhMD4mrevOZONgYLvGdZVw=; b=KbvOoNTOdgW+bGntBbOlvgj920
 uJKWaD4cX2SCIMqt7HOH53Uljl0XgcPW5Y6bvF5XPXC8MbTcHNhXK7F98xUqqHx6j4Prp+LhYRY9a
 YC+8TUt13+aelqeRX8jlQIBzXqlund25VCDPCMlCj5MABHKiKWnfZEwdgTqbPeIY8e2Q=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ukFnk-0000mr-Lv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 05:38:01 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-458be3ab6adso2422915e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Aug 2025 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754631469; x=1755236269; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzN4MoggtOmzsOzNgRPBqPhMD4mrevOZONgYLvGdZVw=;
 b=AiXrC5V1JXQqOiguG9tVWCY++1yp1YndfRQvnys5TKlMUr4naCCo+Vm99Q8cjVll9E
 SysmsvIIQU8Zh8FGxYRXXxEV5um0wzH+NwijzoyyjmyI1CYtWWSqptgmeVnMt7n1iWWO
 K0nlzWNjMRHWS9GAhZyqNgA3lTsZRoe/iLEgK0pec+hYlNh5Z7Olp6OW5zZ5P5Vls1kZ
 nbudlAd2WfevuR6Q7kWYgLQzE2pe9gCEga/5newcuFAz1YPCTHYAY84PZuA9qC2qf7AN
 htfiqlQ9wI6zJpeDHhkXqo7oI4wBPLStNgxmg4EQ0X4UN3xK/L5D+BnOvGx4uoL7/w80
 xhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754631469; x=1755236269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzN4MoggtOmzsOzNgRPBqPhMD4mrevOZONgYLvGdZVw=;
 b=n6skmjm1V6G7hGwM/ymtwowPRw+e4xOPJ7+QU7sNrH86y6FjckMjmdHY49BUstA38O
 CnA5FBtBbUfOu7XMTNrGNF0fNb916wKlQ3iyY3I2zWrcbsgfLtrHpkpVrHPTXqkORVHQ
 HYpoXMRQwc/CnUACmq6OHhzgd2Lmhoh21o0wC6UorD4icRfd4RTI4SFhe4lHPVPoJJkk
 8PO0uI53JuF6XCvIBL0cNFJWz9PbiBY68cniGX8C547w8ywzq8gQBaZTyOQZCkp5dG9T
 jfS33hQohwf68Pq+XOoSEtFEcJrQNBXPJxLXfuczV1urYNLZ3W9Cj+LiCjtyAJ+OJGPu
 yVYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2VY2ownkWzzoDDCd37jR5ZnMwzN/8Gu8f7GVacnP/W1DCGDcRuThTIqt2RF607HcJb+E0YKgmUSFnm25wgWe8@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzgjKyQL2Dz55R7/VVdqDIUjouTZikGxZNOykl7h3l6ldjzoopT
 sSWOO886aWVxmCdmt0hWiNVOU2RtMIjlQuo1ZgSOVjvATU9TFxkmSj+4i3Wq2lEdyD/KdKk84AH
 Q6sb7NQSMhcXEJej+IbUBSSWyW9EO4WA=
X-Gm-Gg: ASbGncuqAWiwxd23A8GLneh0ujh99vfQLTFdG1tsQTjm2m73nemw/hEhLTEl1+c0pYg
 As3htlQc2dhh9G6eBUg47TcSZ/1s/Bm13MLWveUk4I1FsBA7CmlC3K6tHW8fFVY/C0EoMtarpq6
 PLC/yimKwJuKkxswPYqj9TWruSY7aDNazfgaVGi3ZTbtvWCEAN/pmxFHxkjUKHNjp8LC3yIMTj4
 +yJDY1r
X-Google-Smtp-Source: AGHT+IFNjZl3lvP80wU26/7c7t5y/zunPh8F4UzbGKLRT2BnYPfyXNLnEyEVJMX2eO1B9GMhJRNCt5QybfrqFLqUwro=
X-Received: by 2002:a05:6000:2313:b0:3b8:d7c8:ad88 with SMTP id
 ffacd0b85a97d-3b900b355afmr517174f8f.7.1754631468871; Thu, 07 Aug 2025
 22:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250807014836.3780988-1-chao@kernel.org>
 <CAHJ8P3Krr4pCdOmnSJ6mp5bfGLLH4TJqd0FC7Qiw2V3iEL5VEw@mail.gmail.com>
 <b8470c47-4fc2-48da-b93d-cb469638fb43@kernel.org>
In-Reply-To: <b8470c47-4fc2-48da-b93d-cb469638fb43@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 8 Aug 2025 13:37:37 +0800
X-Gm-Features: Ac12FXyO1t35YLRLfg-zoCYVRhywM-dIpKaua5hGLDGX21JmQ7uEm96uhdsbhck
Message-ID: <CAHJ8P3KPzV9bcu4aYBrgxO-5=5p9xg-KwbYQw9o6SzSe4Za1iw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年8月8日周五 12:14写道： > > On 8/8/2025
    9:07 AM, Zhiguo Niu wrote: > > Chao Yu via Linux-f2fs-devel > > 于2025年8月7日周四
    09:52写道： > >> > >> mount -t f2fs -o c [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.54 listed in wl.mailspike.net]
X-Headers-End: 1ukFnk-0000mr-Lv
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to clear unusable_cap for
 checkpoint=enable
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0OOaciDjml6XlkajkupQgMTI6MTTl
hpnpgZPvvJoKPgo+IE9uIDgvOC8yMDI1IDk6MDcgQU0sIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldD4KPiA+IOS6jjIwMjXlubQ45pyIN+aXpeWRqOWbmyAwOTo1MuWGmemBk++8mgo+
ID4+Cj4gPj4gbW91bnQgLXQgZjJmcyAtbyBjaGVja3BvaW50PWRpc2FibGU6MTAlIC9kZXYvdmRi
IC9tbnQvZjJmcy8KPiA+PiBtb3VudCAtdCBmMmZzIC1vIHJlbW91bnQsY2hlY2twb2ludD1lbmFi
bGUgL2Rldi92ZGIgL21udC9mMmZzLwo+ID4+Cj4gPj4ga2VybmVsIGxvZzoKPiA+PiBGMkZTLWZz
ICh2ZGIpOiBBZGp1c3QgdW51c2FibGUgY2FwIGZvciBjaGVja3BvaW50PWRpc2FibGUgPSAyMDQ0
NDAgLyAxMCUKPiA+Pgo+ID4+IElmIHdlIGhhcyBhc3NpZ25lZCBjaGVja3BvaW50PWVuYWJsZSBt
b3VudCBvcHRpb24sIHVudXNhYmxlX2NhcHssX3BlcmN9Cj4gPj4gcGFyYW1ldGVycyBvZiBjaGVj
a3BvaW50PWRpc2FibGUgc2hvdWxkIGJlIHJlc2V0LCB0aGVuIGNhbGN1bGF0aW9uIGFuZAo+ID4+
IGxvZyBwcmludCBjb3VsZCBiZSBhdm9pZCBpbiBhZGp1c3RfdW51c2FibGVfY2FwX3BlcmMoKS4K
PiA+Pgo+ID4+IEZpeGVzOiAxYWUxOGY3MWNiNTIgKCJmMmZzOiBmaXggY2hlY2twb2ludD1kaXNh
YmxlOiV1JSUiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4K
PiA+PiAtLS0KPiA+PiAgIGZzL2YyZnMvc3VwZXIuYyB8IDQgKysrKwo+ID4+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3Vw
ZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4+IGluZGV4IGYzNzAwNDc4MGNlMC4uYzFmNDVkZjll
ZmVjIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ID4+ICsrKyBiL2ZzL2YyZnMv
c3VwZXIuYwo+ID4+IEBAIC0xMDE0LDYgKzEwMTQsMTAgQEAgc3RhdGljIGludCBmMmZzX3BhcnNl
X3BhcmFtKHN0cnVjdCBmc19jb250ZXh0ICpmYywgc3RydWN0IGZzX3BhcmFtZXRlciAqcGFyYW0p
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGN0eF9zZXRfb3B0KGN0eCwgRjJGU19NT1VO
VF9ESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+PiAgICAgICAgICAgICAgICAgIGNhc2UgT3B0X2NoZWNrcG9pbnRfZW5hYmxlOgo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgIEYyRlNfQ1RYX0lORk8oY3R4KS51bnVzYWJsZV9jYXBf
cGVyYyA9IDA7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5zcGVjX21hc2sgfD0g
RjJGU19TUEVDX2NoZWNrcG9pbnRfZGlzYWJsZV9jYXBfcGVyYzsKPiA+PiArICAgICAgICAgICAg
ICAgICAgICAgICBGMkZTX0NUWF9JTkZPKGN0eCkudW51c2FibGVfY2FwID0gMDsKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICBjdHgtPnNwZWNfbWFzayB8PSBGMkZTX1NQRUNfY2hlY2twb2lu
dF9kaXNhYmxlX2NhcDsKPiA+IEhpIENoYW8sCj4gPiB3aGVuIGVuYWJsZSBjaGVja3BvaW50LCBz
aG91ZCBpdCBiZToKPiA+IGN0eC0+c3BlY19tYXNrICY9IH5GMkZTX1NQRUNfY2hlY2twb2ludF9k
aXNhYmxlX2NhcF9wZXJjOwo+ID4gY3R4LT5zcGVjX21hc2sgJj0gfkYyRlNfU1BFQ19jaGVja3Bv
aW50X2Rpc2FibGVfY2FwOwo+ID4gcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBtaXN1bmRlcnN0YW5k
aW5nLgo+Cj4gWmhpZ3VvLAo+Cj4gSU1PLCBGMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxlX2Nh
cF9wZXJjIG9yIEYyRlNfU1BFQ19jaGVja3BvaW50X2Rpc2FibGVfY2FwCj4gZmxhZ3MgY2FuIGJl
IGFkZGVkIHRvIGN0eC0+c3BlY19tYXNrIHRvIGluZGljYXRlIGN0eC51bnVzYWJsZV9jYXBfcGVy
YyBvcgo+IGN0eC51bnVzYWJsZV9jYXAgaGFzIGJlZW4gdXBkYXRlZCwgdGhlbiB3ZSBjYW4gc3Rv
cmUgbGFzdCBwYXJhbWV0ZXIgdmFsdWUgZnJvbQo+IGN0eCB0byBzYmkgaW4gZjJmc19hcHBseV9v
cHRpb25zKCkgYXMgYmVsb3c6Cj4KPiAgICAgICAgIGlmIChjdHgtPnNwZWNfbWFzayAmIEYyRlNf
U1BFQ19jaGVja3BvaW50X2Rpc2FibGVfY2FwKQo+ICAgICAgICAgICAgICAgICBGMkZTX09QVElP
TihzYmkpLnVudXNhYmxlX2NhcCA9IEYyRlNfQ1RYX0lORk8oY3R4KS51bnVzYWJsZV9jYXA7Cj4g
ICAgICAgICBpZiAoY3R4LT5zcGVjX21hc2sgJiBGMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxl
X2NhcF9wZXJjKQo+ICAgICAgICAgICAgICAgICBGMkZTX09QVElPTihzYmkpLnVudXNhYmxlX2Nh
cF9wZXJjID0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19D
VFhfSU5GTyhjdHgpLnVudXNhYmxlX2NhcF9wZXJjOwo+Cj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0
aGluZyBoZXJlPwpIaSBDaGFvLAoKQWgsICB5ZXMgeW91IGFyZSByaWdodO+8gQpUaGVyZSdzIHNv
bWV0aGluZyB3cm9uZyB3aXRoIG15IHRoaW5raW5nLgp0aGFuayB5b3UgZm9yIHlvdXIgZXhwbGFu
YXRpb24sIHNvcnJ5IGZvciB0aGUgZGlzdHVyYmFuY2UuCnRoYW5rcyEKPgo+IFRoYW5rcywKPgo+
ID4gdGhhbmtzIQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBjdHhfY2xlYXJfb3B0KGN0
eCwgRjJGU19NT1VOVF9ESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+PiAgICAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPj4gLS0KPiA+
PiAyLjQ5LjAKPiA+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+PiBodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
