Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 054EFBA8D78
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 12:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71drmjUJ5wF3nttXAD172K/BiV4bzCBKE5cCBVrBhyg=; b=aKjuBeauMQ1vvyb79unvOi1Jp1
	Zhfx626cYcHHTTE2LIdHS9FO1WAO+b0/+SbVs8fWIEC3aXLfBq7H/kPNULee9Jd+GzFqo/b6YUHH+
	9F6Pwfx1MGWytPXiS5U0Ow3ZqPFaO/YFPFqntZGkejoVJXkCf4TWcCzUCwiu3H6eTQgY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3Aus-0007eY-QB;
	Mon, 29 Sep 2025 10:15:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wqu@suse.com>) id 1v3Aur-0007eS-LE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJ7ANp4feSsM3nr9F6qlr3qgsjhlMNU0LNT+QvpHtqI=; b=mmvx6jlswlhCRhy0/di7/z1Z6j
 RJMA/2RxD7Av0euXyCKUkG4A00KhXHNuSfwY+AjCg3tA8FrQX3N3NjMBGspxHIYgd1RuXL3BVjqfJ
 H5SLXZRbNt+AlWd+sz6nr5kn2KL4zXwrTp/zcH4tQsCgXyuCRe0pPe3iHVsg45Mf5478=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kJ7ANp4feSsM3nr9F6qlr3qgsjhlMNU0LNT+QvpHtqI=; b=cT6+/1fF172aynIcRB0hWiknb0
 3O9bGv3Shh0qaX/rlywwBWuOVkUg9fSayFib0fchRtADzYKgoBT5YIx31PADOJ28IOdjg0z0iBsaU
 fzHRXPxqMXK7SlhgVyDfrGsb+pR3XNG4d9535fAIjtXi7nwjs3I4ueOTPTu+wtu7gu9o=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3Aur-0007o0-1x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:15:33 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso3561150f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1759140926; x=1759745726; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kJ7ANp4feSsM3nr9F6qlr3qgsjhlMNU0LNT+QvpHtqI=;
 b=F/sO9G1r18MMB3XCTFLE5VQQx/bS/ttPw9CbImWH+Wzz5PefSokmWlNGsv/DWplZT2
 ZL2tlWXrnruQVReP+1Q7ozXkgBEkLHLViKUhK64wVKice9ObRyRDssqvxSR8pubZAzHN
 ml+7Fxhe7U1w+piZiGYIb122T1GNHN9iHaHYxuwn4LJmQxLjSurXUgZdp+1o18zHD4yn
 3b5sUHZOkLX4F96qvYIOeSeGIUjmPcp6f8Bj7p5GTaEzTQSgIxqft97GyV1+CdJ0fJbU
 nNezK2O29i9VHU7GVOLXkbjj6lNdDur7AFGCHCMYaJ0/Aw8UVJSPoto/fgDmjVOQu3U6
 zhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759140926; x=1759745726;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJ7ANp4feSsM3nr9F6qlr3qgsjhlMNU0LNT+QvpHtqI=;
 b=Zd8KiMC8UM8DhIXcPVkUleN1x4ccBw9zPu+zFv+cOjquMkxGlRnpVwqKeTOLyIR/80
 XW1iIiCk4TRINEzAZQhpEcG9qu5M1DJdgTkQ3f+0ZtF4+v8pVA8RX4sdrRat8Bi9cmRO
 fLxcBAgmuDcC/id9NAJAaqZvVtjARnMAMt485lsxxwI6vf0+g3+rrZMfhD0hyWRBs7Ic
 eK5uQQs147V6wajPx+CwkB5v78JcGWWZxBlOe4uy3RikQHhsClPTlQK2T1vbqw4wtQ4X
 TsClL/S5Ihcim9cclqqrPnqzq3J5rJY6NGnVKd496SigqPnunGGGxZccz3FFMVbeRh21
 1K+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBt7ofX114KWboVvNgyZ++8xvdDNMTZyEqNdeqdTKoNEm9q+EeHDie0/qhMlNFIVJBP5vVc6AQArJTZs6vgRoO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyGyFR7OnRDvGvuIQD2YLUMZG6nNLV0rFy3gr8XhdICVhotANDL
 wPBA2EpX8iQzdPCOi6Tk8ooiuzKmw5gu3B/11YBtU9a4FVD/aRzkOH8XcyeGSWNMlrY=
X-Gm-Gg: ASbGncsTgVCEui8bm9bwowg33VHGZJYMvqC6gVPMy2tR8urJ3VzwpmcFfM5xHeUKR0b
 0mElSJneWWHMvGofgJnzdxFsJP5gAqy6uawgg2MTDmuvHWJG8EQIhzPBU5XJcwvNmX7S2IXYcPc
 3fyiCHYUdm03MWYbIQO84hLPITzHGv43TX8at4IE9feLsRnjtKzFIyBRmnTDDT5YXwZnvMMXOIi
 wGbTKVpJ7pBkrAL8jXb6H0zOxM59pB/f5oG36DVlb3VeuX2KfKoiQ8+22wvcA6Nonkqy8MdnL/Z
 eDd9HmpOr/en2pwrQOtxcAo1rXkX/LeFRqbyxWoa15sECvqWU98XBAYswqFUwqR97uHzH7TgwuX
 AnIX6PiLRE33nl6/+wdExUqNyePVbM+pKQ4vB/pxWYgiWSgOuH32BOq1MuENzCw==
X-Google-Smtp-Source: AGHT+IGwTABp0W8HTZ2uL4D0fPeCysmK0pZooV1lhBdIbr6aucHS3wGZOHDl4iox0FoIORnkSbDjGg==
X-Received: by 2002:a05:6000:2907:b0:3f7:b7ac:f3aa with SMTP id
 ffacd0b85a97d-40e4b850bc6mr14254003f8f.29.1759140926337; 
 Mon, 29 Sep 2025 03:15:26 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299?
 (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed68821d3sm126868845ad.83.2025.09.29.03.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:15:25 -0700 (PDT)
Message-ID: <f8cf2061-44f3-4775-b321-713dc90c3282@suse.com>
Date: Mon, 29 Sep 2025 19:45:18 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julian Sun <sunjunchao@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20250929095544.308392-1-sunjunchao@bytedance.com>
Content-Language: en-US
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20250929095544.308392-1-sunjunchao@bytedance.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/9/29 19:25, Julian Sun 写道: > The logic in wbc_to_tag()
    is widely used in file systems, so modify this > function to be extern and
    use it in file systems. > > This patch has only passed co [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.47 listed in wl.mailspike.net]
X-Headers-End: 1v3Aur-0007o0-1x
Subject: Re: [f2fs-dev] [PATCH] fs: Make wbc_to_tag() extern and use it in
 fs.
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <wqu@suse.com>
Cc: brauner@kernel.org, tytso@mit.edu, agruenba@redhat.com, jack@suse.cz,
 willy@infradead.org, clm@fb.com, adilger.kernel@dilger.ca, dsterba@suse.com,
 jaegeuk@kernel.org, idryomov@gmail.com, xiubli@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS85LzI5IDE5OjI1LCBKdWxpYW4gU3VuIOWGmemBkzoKPiBUaGUgbG9naWMgaW4g
d2JjX3RvX3RhZygpIGlzIHdpZGVseSB1c2VkIGluIGZpbGUgc3lzdGVtcywgc28gbW9kaWZ5IHRo
aXMKPiBmdW5jdGlvbiB0byBiZSBleHRlcm4gYW5kIHVzZSBpdCBpbiBmaWxlIHN5c3RlbXMuCj4g
Cj4gVGhpcyBwYXRjaCBoYXMgb25seSBwYXNzZWQgY29tcGlsYXRpb24gdGVzdHMsIGJ1dCBpdCBz
aG91bGQgYmUgZmluZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gU3VuIDxzdW5qdW5jaGFv
QGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gICBmcy9idHJmcy9leHRlbnRfaW8uYyAgICAgIHwgNSAr
LS0tLQo+ICAgZnMvY2VwaC9hZGRyLmMgICAgICAgICAgICB8IDYgKy0tLS0tCj4gICBmcy9leHQ0
L2lub2RlLmMgICAgICAgICAgIHwgNSArLS0tLQo+ICAgZnMvZjJmcy9kYXRhLmMgICAgICAgICAg
ICB8IDUgKy0tLS0KPiAgIGZzL2dmczIvYW9wcy5jICAgICAgICAgICAgfCA1ICstLS0tCj4gICBp
bmNsdWRlL2xpbnV4L3dyaXRlYmFjay5oIHwgMSArCj4gICBtbS9wYWdlLXdyaXRlYmFjay5jICAg
ICAgIHwgMiArLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9idHJmcy9leHRlbnRfaW8uYyBiL2ZzL2J0cmZz
L2V4dGVudF9pby5jCj4gaW5kZXggYjIxY2I3MjgzNWNjLi4wZmVhNTgyODcxNzUgMTAwNjQ0Cj4g
LS0tIGEvZnMvYnRyZnMvZXh0ZW50X2lvLmMKPiArKysgYi9mcy9idHJmcy9leHRlbnRfaW8uYwo+
IEBAIC0yMzkwLDEwICsyMzkwLDcgQEAgc3RhdGljIGludCBleHRlbnRfd3JpdGVfY2FjaGVfcGFn
ZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCQkgICAgICAgJkJUUkZTX0ko
aW5vZGUpLT5ydW50aW1lX2ZsYWdzKSkKPiAgIAkJd2JjLT50YWdnZWRfd3JpdGVwYWdlcyA9IDE7
Cj4gICAKPiAtCWlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dl
ZF93cml0ZXBhZ2VzKQo+IC0JCXRhZyA9IFBBR0VDQUNIRV9UQUdfVE9XUklURTsKPiAtCWVsc2UK
PiAtCQl0YWcgPSBQQUdFQ0FDSEVfVEFHX0RJUlRZOwo+ICsJdGFnID0gd2JjX3RvX3RhZyh3YmMp
Owo+ICAgcmV0cnk6Cj4gICAJaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IHdi
Yy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gICAJCXRhZ19wYWdlc19mb3Jfd3JpdGViYWNrKG1hcHBp
bmcsIGluZGV4LCBlbmQpOwo+IGRpZmYgLS1naXQgYS9mcy9jZXBoL2FkZHIuYyBiL2ZzL2NlcGgv
YWRkci5jCj4gaW5kZXggMzIyZWQyNjhmMTRhLi42M2I3NWQyMTQyMTAgMTAwNjQ0Cj4gLS0tIGEv
ZnMvY2VwaC9hZGRyLmMKPiArKysgYi9mcy9jZXBoL2FkZHIuYwo+IEBAIC0xMDQ1LDExICsxMDQ1
LDcgQEAgdm9pZCBjZXBoX2luaXRfd3JpdGViYWNrX2N0bChzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
bWFwcGluZywKPiAgIAljZXBoX3diYy0+aW5kZXggPSBjZXBoX3diYy0+c3RhcnRfaW5kZXg7Cj4g
ICAJY2VwaF93YmMtPmVuZCA9IC0xOwo+ICAgCj4gLQlpZiAod2JjLT5zeW5jX21vZGUgPT0gV0Jf
U1lOQ19BTEwgfHwgd2JjLT50YWdnZWRfd3JpdGVwYWdlcykgewo+IC0JCWNlcGhfd2JjLT50YWcg
PSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4gLQl9IGVsc2Ugewo+IC0JCWNlcGhfd2JjLT50YWcg
PSBQQUdFQ0FDSEVfVEFHX0RJUlRZOwo+IC0JfQo+ICsJY2VwaF93YmMtPnRhZyA9IHdiY190b190
YWcod2JjKTsKPiAgIAo+ICAgCWNlcGhfd2JjLT5vcF9pZHggPSAtMTsKPiAgIAljZXBoX3diYy0+
bnVtX29wcyA9IDA7Cj4gZGlmZiAtLWdpdCBhL2ZzL2V4dDQvaW5vZGUuYyBiL2ZzL2V4dDQvaW5v
ZGUuYwo+IGluZGV4IDViN2ExNWRiNDk1My4uMTk2ZWJhN2ZhMzljIDEwMDY0NAo+IC0tLSBhL2Zz
L2V4dDQvaW5vZGUuYwo+ICsrKyBiL2ZzL2V4dDQvaW5vZGUuYwo+IEBAIC0yNjE5LDEwICsyNjE5
LDcgQEAgc3RhdGljIGludCBtcGFnZV9wcmVwYXJlX2V4dGVudF90b19tYXAoc3RydWN0IG1wYWdl
X2RhX2RhdGEgKm1wZCkKPiAgIAloYW5kbGVfdCAqaGFuZGxlID0gTlVMTDsKPiAgIAlpbnQgYnBw
ID0gZXh0NF9qb3VybmFsX2Jsb2Nrc19wZXJfZm9saW8obXBkLT5pbm9kZSk7Cj4gICAKPiAtCWlm
IChtcGQtPndiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IG1wZC0+d2JjLT50YWdnZWRf
d3JpdGVwYWdlcykKPiAtCQl0YWcgPSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4gLQllbHNlCj4g
LQkJdGFnID0gUEFHRUNBQ0hFX1RBR19ESVJUWTsKPiArCXRhZyA9IHdiY190b190YWcobXBkLT53
YmMpOwo+ICAgCj4gICAJbXBkLT5tYXAubV9sZW4gPSAwOwo+ICAgCW1wZC0+bmV4dF9wb3MgPSBt
cGQtPnN0YXJ0X3BvczsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYwo+IGluZGV4IDc5NjFlMGRkZmNhMy4uMTAxZTk2Mjg0NWRiIDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtMzAwMywxMCArMzAwMyw3
IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9jYWNoZV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFj
ZSAqbWFwcGluZywKPiAgIAkJaWYgKHdiYy0+cmFuZ2Vfc3RhcnQgPT0gMCAmJiB3YmMtPnJhbmdl
X2VuZCA9PSBMTE9OR19NQVgpCj4gICAJCQlyYW5nZV93aG9sZSA9IDE7Cj4gICAJfQo+IC0JaWYg
KHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMp
Cj4gLQkJdGFnID0gUEFHRUNBQ0hFX1RBR19UT1dSSVRFOwo+IC0JZWxzZQo+IC0JCXRhZyA9IFBB
R0VDQUNIRV9UQUdfRElSVFk7Cj4gKwl0YWcgPSB3YmNfdG9fdGFnKHdiYyk7Cj4gICByZXRyeToK
PiAgIAlyZXRyeSA9IDA7Cj4gICAJaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8
IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gZGlmZiAtLWdpdCBhL2ZzL2dmczIvYW9wcy5jIGIv
ZnMvZ2ZzMi9hb3BzLmMKPiBpbmRleCA0N2Q3NGFmZDYzYWMuLjEyMzk0ZmM1ZGQyOSAxMDA2NDQK
PiAtLS0gYS9mcy9nZnMyL2FvcHMuYwo+ICsrKyBiL2ZzL2dmczIvYW9wcy5jCj4gQEAgLTMxMSwx
MCArMzExLDcgQEAgc3RhdGljIGludCBnZnMyX3dyaXRlX2NhY2hlX2pkYXRhKHN0cnVjdCBhZGRy
ZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCQkJcmFuZ2Vfd2hvbGUgPSAxOwo+ICAgCQljeWNsZWQg
PSAxOyAvKiBpZ25vcmUgcmFuZ2VfY3ljbGljIHRlc3RzICovCj4gICAJfQo+IC0JaWYgKHdiYy0+
c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gLQkJ
dGFnID0gUEFHRUNBQ0hFX1RBR19UT1dSSVRFOwo+IC0JZWxzZQo+IC0JCXRhZyA9IFBBR0VDQUNI
RV9UQUdfRElSVFk7Cj4gKwl0YWcgPSB3YmNfdG9fdGFnKHdiYyk7Cj4gICAKPiAgIHJldHJ5Ogo+
ICAgCWlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dlZF93cml0
ZXBhZ2VzKQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3dyaXRlYmFjay5oIGIvaW5jbHVk
ZS9saW51eC93cml0ZWJhY2suaAo+IGluZGV4IGEyODQ4ZDczMWE0Ni4uODg0ODExNTk2ZTEwIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L3dyaXRlYmFjay5oCj4gQEAgLTM3MCw2ICszNzAsNyBAQCBpbnQgZG9fd3JpdGVwYWdlcyhz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3
YmMpOwo+ICAgdm9pZCB3cml0ZWJhY2tfc2V0X3JhdGVsaW1pdCh2b2lkKTsKPiAgIHZvaWQgdGFn
X3BhZ2VzX2Zvcl93cml0ZWJhY2soc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJ
CQkgICAgIHBnb2ZmX3Qgc3RhcnQsIHBnb2ZmX3QgZW5kKTsKPiAreGFfbWFya190IHdiY190b190
YWcoc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMpOwo+ICAgCj4gICBib29sIGZpbGVtYXBf
ZGlydHlfZm9saW8oc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHN0cnVjdCBmb2xpbyAq
Zm9saW8pOwo+ICAgYm9vbCBmb2xpb19yZWRpcnR5X2Zvcl93cml0ZXBhZ2Uoc3RydWN0IHdyaXRl
YmFja19jb250cm9sICosIHN0cnVjdCBmb2xpbyAqKTsKPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZS13
cml0ZWJhY2suYyBiL21tL3BhZ2Utd3JpdGViYWNrLmMKPiBpbmRleCAzZTI0OGQxYzM5NjkuLjI0
MzgwOGUxOTQ0NSAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlLXdyaXRlYmFjay5jCj4gKysrIGIvbW0v
cGFnZS13cml0ZWJhY2suYwo+IEBAIC0yNDM0LDcgKzI0MzQsNyBAQCBzdGF0aWMgYm9vbCBmb2xp
b19wcmVwYXJlX3dyaXRlYmFjayhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAly
ZXR1cm4gdHJ1ZTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgeGFfbWFya190IHdiY190b190YWcoc3Ry
dWN0IHdyaXRlYmFja19jb250cm9sICp3YmMpCj4gK3hhX21hcmtfdCB3YmNfdG9fdGFnKHN0cnVj
dCB3cml0ZWJhY2tfY29udHJvbCAqd2JjKQoKVGhlIGZ1bmN0aW9uIGlzIHNtYWxsIGVub3VnaCwg
d2h5IG5vdCBleHBvcnQgaXQgYXMgYW4gaW5saW5lIGZ1bmN0aW9uPwoKVGhlIGN1cnJlbnQgdmVy
c2lvbiBhbHNvIGxhY2tzIEVYUE9SVF9TWU1CT0woKSwgaXQgbWF5IGNhdXNlIHByb2JsZW1zIApm
b3IgZnNlcyBidWlsdCBhcyBhIG1vZHVsZS4KClRoYW5rcywKUXUKCj4gICB7Cj4gICAJaWYgKHdi
Yy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4g
ICAJCXJldHVybiBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7CgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
