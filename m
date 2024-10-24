Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACE9AE328
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 12:58:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3vXm-0003G0-W7;
	Thu, 24 Oct 2024 10:58:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t3vXm-0003Fu-4E
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 10:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0zv4SMHXvV0Lwj3C1Vjp7KHVDJuw2pOpFawGmV23O5A=; b=O3HbqhYLJxV+TptQdDW3JI70Y1
 Fu+G5U811TN8J8kfzjsUmOrxnfIHOwBSIppjzF8KNqiPO0bQXpKXwJE3wnMcIHYDQLGk3Z8vxTDSQ
 yRkRqDGxaHBa4RjwZmodFLObrggZY8rXFH5lqffSy/fdWXqxgc7/u9b8JabWrahZ/qp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0zv4SMHXvV0Lwj3C1Vjp7KHVDJuw2pOpFawGmV23O5A=; b=EFtUfue8PGyjBPGVMfY/2Lwzmr
 t/H8TJDH/JavhCuxB2349IUgg42TxDqyo4MH7/WmJ/Wy93SGek2cCunqckkctfYdAoFDA3IYa+GJA
 hjwIT8ccvhWsF7fRsvZBFnaeZvLYx991TQoMyaVMrqaQJWWrE4VOxEWwXsO+DBaisd0g=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t3vXm-0001PA-3J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 10:58:18 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43160c5bad8so961645e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2024 03:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729767491; x=1730372291; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zv4SMHXvV0Lwj3C1Vjp7KHVDJuw2pOpFawGmV23O5A=;
 b=k1zmY7KF8ZCvySJXTg5kA+2XeqryGIR/r2j+Htj3q2jnG11M9Ght4YcpBSL22KnCiu
 2rkcmfU71Ntb4xg78XY9jN75Jvni5LEILmbmIif4hph9rDABGaxWMgePNGQ3xZwDxDHj
 5GjLap9W4kRjH4Z2EB2p4vkhdWxffF1u/i/XwUCCbD0f75n84zogmZ4bYRWzrw4rsmRJ
 K96QitH/HkfpdxINghqd4Q20VTimIdWJbgMGm5HdkDwZbhccMndvodfxrSyMDi1DWW7U
 bb8RaEJTNQq4de8xDUocJHg9FFOjHIW/DiX1hIt6pgbzPsMr2WYcu+w5HODwbfeE0Ygs
 gv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729767491; x=1730372291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zv4SMHXvV0Lwj3C1Vjp7KHVDJuw2pOpFawGmV23O5A=;
 b=oUL2rKuOoWUpj3ibPP25tONsTDWFQkfeuvNy8jJdKw6kNsPAmb14kjCA/DyWQuAWIU
 xBAajW6bVf2bHEoe3mcqCPdCQC3uA/WPmGNYuGepHwglKqZiEkOIU1nk9+UgD7MpYp5x
 1f6Dr4Lj1gDQ69kut5EyY+CRX+OBCaGSwP78zwKCkoKJWDkP95Bllc27ny0e+yII06nh
 J1irqulg4EWqm6ldtc2fwrym1Ts0/BrqpsKR+deCKYRw+dGwBwWqzHTYeYpaq00kakaA
 ERhzM0jbXQwhuEfC0UP0pbz3CZO34752qhlWNqDvpUrNOZ23cYGAFH5CAl4vbYxKFvBf
 j4pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYGLULP610zRZXCW9ZaGWZHHOwqGJ/UzTAEijUz9Dp2yzHyFHyeH/zfXMSwjSHkr9vRAp5f8OdcxAA57pFy4re@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwWeJvtF7Tg1hCD02j2x+yHCIVIwIhx8NiWV1D3vdXtj+mrgQ6I
 sQd/Y964aKF3zuDgcLKFjsrrtxQJE3jzLVq9+UT+yxuJGKvJA7NPE39/DnO55gwUmFNznvmMia5
 l5zK+9nlI5NB+yKoZO4EbF9C11tjgkA==
X-Google-Smtp-Source: AGHT+IF3V+ObpOWRQ5gjk0uIrskTuM/wJAHieZfGNYPmC6LXK/5o/EYX7DdEOnP8BUfj1Xd60A26cASjhsbWE27wUG4=
X-Received: by 2002:a05:600c:350f:b0:42c:b9c8:2b95 with SMTP id
 5b1f17b1804b1-431841a3515mr22899395e9.6.1729767490993; Thu, 24 Oct 2024
 03:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <1729762134-380-1-git-send-email-zhiguo.niu@unisoc.com>
 <a224e560-2937-4edd-93d8-8077de6054b1@kernel.org>
In-Reply-To: <a224e560-2937-4edd-93d8-8077de6054b1@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 24 Oct 2024 18:57:59 +0800
Message-ID: <CAHJ8P3J+OZHhKNSSXc_RM8Xn=1nvfCk8_rqknjXsq==VpvuFPQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年10月24日周四 18:49写道： > > On 2024/10/24
    17:28, Zhiguo Niu wrote: > > F2FS_BLKSIZE may be 4KB, 16KB, so use F2FS_BLKSIZE
    to replace > > some hardcode desc about unit in so [...] 
 
 Content analysis details:   (-1.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.49 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t3vXm-0001PA-3J
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: correct some confused desc about
 unit
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTDmnIgyNOaXpeWRqOWbmyAxODo0
OeWGmemBk++8mgo+Cj4gT24gMjAyNC8xMC8yNCAxNzoyOCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
IEYyRlNfQkxLU0laRSBtYXkgYmUgNEtCLCAxNktCLCBzbyB1c2UgRjJGU19CTEtTSVpFIHRvIHJl
cGxhY2UKPiA+IHNvbWUgaGFyZGNvZGUgZGVzYyBhYm91dCB1bml0IGluIHNvbWUgZjJmc19pbyBj
bWQsIGFsc28KPiA+IGFkanVzdCAiLWMiIHBhcmFtZXRlcnMgaW4gbWtmcyBtYW4sIHRvIGJlIGNv
bnNpc3RlbnQgd2l0aAo+ID4gY29tbWl0IGMzNWZhOGNkNzVhYyAoIm1rZnMuZjJmczogY2hhbmdl
IC1jIG9wdGlvbiBkZXNjcmlwdGlvbiIpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBO
aXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+IC0tLQo+ID4gICBtYW4vbWtmcy5mMmZzLjgg
ICAgICAgICB8IDIgKy0KPiA+ICAgdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgfCA2ICsrKy0tLQo+
ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvbWFuL21rZnMuZjJmcy44IGIvbWFuL21rZnMuZjJmcy44Cj4gPiBp
bmRleCBkZTg4NWJlLi44YjNiMGNjIDEwMDY0NAo+ID4gLS0tIGEvbWFuL21rZnMuZjJmcy44Cj4g
PiArKysgYi9tYW4vbWtmcy5mMmZzLjgKPiA+IEBAIC0xMjIsNyArMTIyLDcgQEAgYmxvY2sgc2l6
ZSBtYXRjaGVzIHRoZSBwYWdlIHNpemUuCj4gPiAgIFRoZSBkZWZhdWx0IHZhbHVlIGlzIDQwOTYu
Cj4gPiAgIC5UUAo+ID4gICAuQkkgXC1jICIgZGV2aWNlLWxpc3QiCj4gPiAtQnVpbGQgZjJmcyB3
aXRoIHRoZXNlIGFkZGl0aW9uYWwgY29tbWEgc2VwYXJhdGVkIGRldmljZXMsIHNvIHRoYXQgdGhl
IHVzZXIgY2FuCj4gPiArQnVpbGQgZjJmcyB3aXRoIHRoZXNlIGFkZGl0aW9uYWwgZGV2aWNlcywg
c28gdGhhdCB0aGUgdXNlciBjYW4KPiA+ICAgc2VlIGFsbCB0aGUgZGV2aWNlcyBhcyBvbmUgYmln
IHZvbHVtZS4KPiA+ICAgU3VwcG9ydHMgdXAgdG8gNyBkZXZpY2VzIGV4Y2VwdCBtZXRhIGRldmlj
ZS4KPiA+ICAgLlRQCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90
b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+ID4gaW5kZXggOTVmNTc1Zi4uZWU0ZWQwZSAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gPiArKysgYi90b29scy9mMmZzX2lv
L2YyZnNfaW8uYwo+ID4gQEAgLTEwMTMsNyArMTAxMyw3IEBAIHN0YXRpYyB2b2lkIGRvX3JhbmRy
ZWFkKGludCBhcmdjLCBjaGFyICoqYXJndiwgY29uc3Qgc3RydWN0IGNtZF9kZXNjICpjbWQpCj4g
Pgo+ID4gICAjZGVmaW5lIGZpZW1hcF9kZXNjICJnZXQgYmxvY2sgYWRkcmVzcyBpbiBmaWxlIgo+
ID4gICAjZGVmaW5lIGZpZW1hcF9oZWxwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gLSJmMmZzX2lvIGZpZW1hcCBbb2Zmc2V0IGluIDRrYl0gW2NvdW50IGluIDRrYl0gW2Zp
bGVfcGF0aF1cblxuIlwKPiA+ICsiZjJmc19pbyBmaWVtYXAgW29mZnNldCBpbiBGMkZTX0JMS1NJ
WkVdIFtjb3VudCBpbiBGMkZTX0JMS1NJWkVdIFtmaWxlX3BhdGhdXG5cbiJcCj4gPgo+ID4gICAj
aWYgZGVmaW5lZChIQVZFX0xJTlVYX0ZJRU1BUF9IKSAmJiBkZWZpbmVkKEhBVkVfTElOVVhfRlNf
SCkKPiA+ICAgc3RhdGljIHZvaWQgZG9fZmllbWFwKGludCBhcmdjLCBjaGFyICoqYXJndiwgY29u
c3Qgc3RydWN0IGNtZF9kZXNjICpjbWQpCj4gPiBAQCAtMTYxNyw4ICsxNjE3LDggQEAgc3RhdGlj
IHZvaWQgZG9fbW92ZV9yYW5nZShpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBj
bWRfZGVzYyAqY21kKQo+ID4gICAjZGVmaW5lIGdjX3JhbmdlX2Rlc2MgInRyaWdnZXIgZmlsZXN5
c3RlbSBnY19yYW5nZSIKPiA+ICAgI2RlZmluZSBnY19yYW5nZV9oZWxwICJmMmZzX2lvIGdjX3Jh
bmdlIFtzeW5jX21vZGVdIFtzdGFydF0gW2xlbmd0aF0gW2ZpbGVfcGF0aF1cblxuIlwKPiA+ICAg
IiAgc3luY19tb2RlIDogMDogYXN5bmNocm9ub3VzLCAxOiBzeW5jaHJvbm91c1xuIiAgICAgICAg
ICAgICAgICAgICBcCj4gPiAtIiAgc3RhcnQgICAgIDogc3RhcnQgb2Zmc2V0IG9mIGRlZnJhZ21l
bnQgcmVnaW9uLCB1bml0OiA0a2JcbiIgICAgICAgXAo+ID4gLSIgIGxlbmd0aCAgICA6IGJ5dGVz
IG51bWJlciBvZiBkZWZyYWdtZW50IHJlZ2lvbiwgdW5pdDogNGtiXG4iICAgICAgIFwKPiA+ICsi
ICBzdGFydCAgICAgOiBzdGFydCBvZmZzZXQgb2YgZGVmcmFnbWVudCByZWdpb24sIHVuaXQ6IEYy
RlNfQkxLU0laRVxuIiAgICAgIFwKPiA+ICsiICBsZW5ndGggICAgOiBieXRlcyBudW1iZXIgb2Yg
ZGVmcmFnbWVudCByZWdpb24sIHVuaXQ6IEYyRlNfQkxLU0laRVxuIiAgICAgIFwKPgo+IEkgdGhp
bmsgd2UnZCBiZXR0ZXIgdW5pZnkgZGVmYXVsdCBibG9jayBzaXplIHRvIDQwOTYgc2luY2UgaW4g
bW9zdCBvZgo+IHBsYWNlcyBpbiBmMmZzX2lvLmMsIHdlIHVzZSA0MDk2IGFzIGRlZmF1bHQgSU8v
YnVmZmVyIHNpemUuCj4KPiBnaXQgZ3JlcCAtbiAiNDA5NiIgdG9vbHMvZjJmc19pby9mMmZzX2lv
LmMKPiB0b29scy9mMmZzX2lvL2YyZnNfaW8uYzoyMTI6ICAgIGFyZ3MuYmxvY2tfc2l6ZSA9IDQw
OTY7Cj4gdG9vbHMvZjJmc19pby9mMmZzX2lvLmM6NjYyOiAgICBidWZfc2l6ZSA9IGJzICogNDA5
NjsKPiB0b29scy9mMmZzX2lvL2YyZnNfaW8uYzo2NjY6ICAgIGJ1ZiA9IGFsaWduZWRfeGFsbG9j
KDQwOTYsIGJ1Zl9zaXplKTsKPiB0b29scy9mMmZzX2lvL2YyZnNfaW8uYzo4Nzc6ICAgIGJ1Zl9z
aXplID0gYnMgKiA0MDk2Owo+IHRvb2xzL2YyZnNfaW8vZjJmc19pby5jOjg4MTogICAgYnVmID0g
YWxpZ25lZF94YWxsb2MoNDA5NiwgYnVmX3NpemUpOwo+IHRvb2xzL2YyZnNfaW8vZjJmc19pby5j
OjkwMTogICAgICAgICAgICBpZiAocG9zaXhfZmFkdmlzZShmZCwgMCwgNDA5NiwgUE9TSVhfRkFE
Vl9TRVFVRU5USUFMKSAhPSAwKQo+IHRvb2xzL2YyZnNfaW8vZjJmc19pby5jOjkwMzogICAgICAg
ICAgICBpZiAocG9zaXhfZmFkdmlzZShmZCwgMCwgNDA5NiwgUE9TSVhfRkFEVl9XSUxMTkVFRCkg
IT0gMCkKPiB0b29scy9mMmZzX2lvL2YyZnNfaW8uYzo5Nzk6ICAgIGJ1Zl9zaXplID0gYnMgKiA0
MDk2Owo+IHRvb2xzL2YyZnNfaW8vZjJmc19pby5jOjk4MTogICAgYnVmID0gYWxpZ25lZF94YWxs
b2MoNDA5NiwgYnVmX3NpemUpOwo+IHRvb2xzL2YyZnNfaW8vZjJmc19pby5jOjk5NDogICAgYWxp
Z25lZF9zaXplID0gKHU2NClzdGJ1Zi5zdF9zaXplICYgfigodTY0KSg0MDk2IC0gMSkpOwo+IHRv
b2xzL2YyZnNfaW8vZjJmc19pby5jOjk5NzogICAgZW5kX2lkeCA9ICh1NjQpKGFsaWduZWRfc2l6
ZSAtIGJ1Zl9zaXplKSAvICh1NjQpNDA5NiArIDE7Cj4gdG9vbHMvZjJmc19pby9mMmZzX2lvLmM6
MTAwNDogICAgICAgICAgIHJldCA9IHByZWFkKGZkLCBidWYsIGJ1Zl9zaXplLCA0MDk2ICogaWR4
KTsKPiB0b29scy9mMmZzX2lvL2YyZnNfaW8uYzoxMjIyOiAgICAgICAgICAgY2hhciAqYnVmID0g
YWxpZ25lZF94YWxsb2MoNDA5NiwgNDA5Nik7Cj4gdG9vbHMvZjJmc19pby9mMmZzX2lvLmM6MTIy
NDogICAgICAgICAgIHdoaWxlICgocmV0ID0geHJlYWQoc3JjX2ZkLCBidWYsIDQwOTYpKSA+IDAp
Cj4KPiBnaXQgZ3JlcCAtbiAiRjJGU19CTEtTSVpFIiB0b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+
IHRvb2xzL2YyZnNfaW8vZjJmc19pby5jOjEwMzQ6ICAgc3RhcnQgPSAodTY0KWF0b2koYXJndlsx
XSkgKiBGMkZTX0JMS1NJWkU7Cj4gdG9vbHMvZjJmc19pby9mMmZzX2lvLmM6MTAzNTogICBsZW5n
dGggPSAodTY0KWF0b2koYXJndlsyXSkgKiBGMkZTX0JMS1NJWkU7Cj4gdG9vbHMvZjJmc19pby9m
MmZzX2lvLmM6MTA0MjogICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydCAvIEYyRlNfQkxL
U0laRSwgbGVuZ3RoIC8gRjJGU19CTEtTSVpFKTsKPgo+IFdlIGNhbiBhZGQgYSBuZXcgbWFjcm8g
RjJGU19ERUZBVUxUX0JMS1NJWkUgYW5kIHVzZSBpdCBpbnN0ZWFkIG9mIG1hZ2ljCj4gbnVtYmVy
IGFuZCBGMkZTX0JMS1NJWkUsIHdoYXQgZG8geW91IHRoaW5rPwpEZWFyIENoYW8sCkl0IGlzIGEg
Z29vZCAgc3VnZ2VzdGlvbnMsICB3aWxsIHVwZGF0ZSBpdC4Kbm93IGl0IGlzIGEgbGl0dGxlIGNv
bmZ1c2VkIHdoZW4gSSB1c2UgZjJmc19pbyBmaWVtYXAgaW4gMTZLQiBwYWdlIHN5c3RlbS4gXl4K
dGhhbmtzIQo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4gICBzdGF0aWMgdm9pZCBkb19nY19yYW5nZShp
bnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4gICB7
Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
