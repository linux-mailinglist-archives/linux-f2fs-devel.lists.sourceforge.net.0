Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B8BAAA9B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 23:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEH/1msF8ig4Dr30gSWVewe+xA4l9ndu7nnntP7Znyw=; b=FeNapu6qweiMhjAyEwAslW2LGs
	sAsERlsv/Z4u+U0bM5toaaboA7jvtwX8q84nsQjxgBAs6JHueIac2q+lzGz1CYhUgH8q7/RVq4l4t
	Ids0lpfzF9su5NaGTHCRA0mRuNSYDGy+ddWLZ66fMrEazxvVyH92Oxs72KEFuJ4tO62A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3Lho-0006nG-MF;
	Mon, 29 Sep 2025 21:46:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wqu@suse.com>) id 1v3Lhm-0006mz-P1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 21:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBQVuh0pyfNoSFHzgB4ISgtBSFYpT2CuO6PbFEJ29As=; b=k/Lqu82w/+vCm+B5y8DZ7d37xU
 5v4AqartL5xdi8MxpcEfdrMAgIpAMrTe4nRiAJud0qDAzF4UyTEkySjq2qAmVHZ4lKbU4Etn0V5Qj
 UX2WUl/8bHdy8ijzqdAtgfcToFdCSSsgk9+Mh0nl4cVqsZB3t88DxMkHjlVAYj+UpqfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBQVuh0pyfNoSFHzgB4ISgtBSFYpT2CuO6PbFEJ29As=; b=DHhOAZwkN93Nk3xLzxOs7qYcyu
 CLZwA/jtx8UtM8xp2hq345Dtr/PA0uRU0SHOXD/Rs4TaUrfEkvws7elGDHzEo1VmDLGIBCHCBHaAI
 lPBkTbOCz6bHMIQTv2SWD9R/A264hdflJ9Y+UFOgkKPimlDZBIYUXnXnalmgOhZ/QnVU=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3Lhm-00032M-QT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 21:46:47 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-421b93ee372so766424f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1759182400; x=1759787200; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JBQVuh0pyfNoSFHzgB4ISgtBSFYpT2CuO6PbFEJ29As=;
 b=XF6jFxu7/jvfV+Tj/gYBApeeKP8po43ccqiBocVXbAH7ebE6RKHIJNuAEdvphoF15f
 I6Z/ak8EUrhAsBTxhB85SWZ9NPGKkJujJn/qymLMCU0xjkgHWnKPdTD1kf0dhXUhfZ9Y
 HIIPL5lH4X/zvC1wQiojEQnTOAnJDRIh5QTY7VLOaT08dzKPuU73t47FEWghJbqO32zO
 rwo9O9KRCPSdTTm5guEqjYpAo7GWjrZSE15QIaVeM3WUVxQRJzblVCHi0LuOwFi04MqP
 8zVr37l9nw46u2kPtMDUhe/SecehszdDPXgt31Om05lrLzTw8OuYbrIiBlqYxa11BQAS
 gmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759182400; x=1759787200;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBQVuh0pyfNoSFHzgB4ISgtBSFYpT2CuO6PbFEJ29As=;
 b=mR6oFGVNbTm5+2mkEfdgaXP9kUXFiy0FjA3iDGsGo2d1LI95Vx5h2DNaSBFlH+zmQc
 tRQO1WgIVEkgNYP4qE/PvyUa5EnJuI+zhoQ2lHisZE8k/rdzZx3Osa8Sa+pNCUBJLxit
 VEP7gQ5m5W/MX8PIvvx7IYXXA0Bf34x3cpLitiMCboLmF5aE2GMR9ldbpvJoIeYDWh6i
 XcnrzNFtdY4rWbgxkE+vh329ChIQYce0pt33E6ECXVZpIVJnLTOwPL8SwWINzeDLsSnv
 PwOAQTE/AKx3/O/1BJxOc0fNx2JHId8zyN6/p/jkuxZRNYd7zN1XOBoVV7L3bMqXzIoh
 aQcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAg+kuowp9gn+DrsEPAdDfE9Dx1axTiIGmRX67bgUufChN1ZXiXdejMEQ6v+B6C6yCH5lJBM321IDCjj6rQ0qp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzmOHk4tu81SMVxgpaI7hlF0SxLXPW4Z1Gy5Ubd3qKwRshLnPxa
 vaIfnBaOr+GRFveGA28SbXIw6USM6KocQy2qY/HK6/lNhmzGLQFpkNsRA5prixk+Zhw=
X-Gm-Gg: ASbGncvme5Hrin2NKVVnq+EyhQidkWYhj1Yq9gTeIsv0zjyZZVvzQU1a/FJHOeq8Isp
 w7cPrXeBd1drLUQL6pqAje0pGoqzwziF+DDt00KhnLULwdZmzrEbCGJtvTm9kN6BBnhlxbUpKzE
 nKoH3vz/OC+CHdC2CuTNjn6NMzLW+wkv+sPkhXi4MplBrocbZk4qCyCnBUao9+WBVc8WJRGYs78
 dEpDvF1aSmkgYPdR15vQaW0LSHwA9Nh67PYLuy66BgGapcsVxZbhLDNHC/DdEt6u7s0e6aAlDP8
 Dzuto7HIuTQMyN22el1WWUmHvstUgWRjk+PBXtM1rmb6w+SNOM5JljMftK4VjL+y5r7fthmeRlU
 POFYY/HeyDMTsAgTr3qpu+JExZhdq0yGoaL61IMKGsLM4lKvHmRY=
X-Google-Smtp-Source: AGHT+IG7ucdybca5Y/dTjKqQS2GBXbxdNdgaDavgXtAwspTObB7YcHr+aCoGLrIQFmroKJMVje+VYw==
X-Received: by 2002:a05:6000:2002:b0:3ee:126a:7aab with SMTP id
 ffacd0b85a97d-40e4dabf373mr17095040f8f.57.1759182400198; 
 Mon, 29 Sep 2025 14:46:40 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299?
 (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7820d7020a8sm6234755b3a.93.2025.09.29.14.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 14:46:39 -0700 (PDT)
Message-ID: <356ac25e-496e-4192-a3e6-2f9f41aa4864@suse.com>
Date: Tue, 30 Sep 2025 07:16:30 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julian Sun <sunjunchao@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20250929111349.448324-1-sunjunchao@bytedance.com>
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
In-Reply-To: <20250929111349.448324-1-sunjunchao@bytedance.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/9/29 20:43, Julian Sun 写道: > The logic in wbc_to_tag()
    is widely used in file systems, so modify this > function to be inline and
    use it in file systems. > > This patch has only passed co [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [209.85.221.50 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.50 listed in wl.mailspike.net]
X-Headers-End: 1v3Lhm-00032M-QT
Subject: Re: [f2fs-dev] [PATCH v2] fs: Make wbc_to_tag() inline and use it
 in fs.
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

CgrlnKggMjAyNS85LzI5IDIwOjQzLCBKdWxpYW4gU3VuIOWGmemBkzoKPiBUaGUgbG9naWMgaW4g
d2JjX3RvX3RhZygpIGlzIHdpZGVseSB1c2VkIGluIGZpbGUgc3lzdGVtcywgc28gbW9kaWZ5IHRo
aXMKPiBmdW5jdGlvbiB0byBiZSBpbmxpbmUgYW5kIHVzZSBpdCBpbiBmaWxlIHN5c3RlbXMuCj4g
Cj4gVGhpcyBwYXRjaCBoYXMgb25seSBwYXNzZWQgY29tcGlsYXRpb24gdGVzdHMsIGJ1dCBpdCBz
aG91bGQgYmUgZmluZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gU3VuIDxzdW5qdW5jaGFv
QGJ5dGVkYW5jZS5jb20+CgpSZXZpZXdlZC1ieTogUXUgV2VucnVvIDx3cXVAc3VzZS5jb20+CgpU
aGFua3MsClF1Cgo+IC0tLQo+ICAgZnMvYnRyZnMvZXh0ZW50X2lvLmMgICAgICB8IDUgKy0tLS0K
PiAgIGZzL2NlcGgvYWRkci5jICAgICAgICAgICAgfCA2ICstLS0tLQo+ICAgZnMvZXh0NC9pbm9k
ZS5jICAgICAgICAgICB8IDUgKy0tLS0KPiAgIGZzL2YyZnMvZGF0YS5jICAgICAgICAgICAgfCA1
ICstLS0tCj4gICBmcy9nZnMyL2FvcHMuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ICAgaW5jbHVk
ZS9saW51eC93cml0ZWJhY2suaCB8IDcgKysrKysrKwo+ICAgbW0vcGFnZS13cml0ZWJhY2suYyAg
ICAgICB8IDYgLS0tLS0tCj4gICA3IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI3
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9idHJmcy9leHRlbnRfaW8uYyBiL2Zz
L2J0cmZzL2V4dGVudF9pby5jCj4gaW5kZXggYjIxY2I3MjgzNWNjLi4wZmVhNTgyODcxNzUgMTAw
NjQ0Cj4gLS0tIGEvZnMvYnRyZnMvZXh0ZW50X2lvLmMKPiArKysgYi9mcy9idHJmcy9leHRlbnRf
aW8uYwo+IEBAIC0yMzkwLDEwICsyMzkwLDcgQEAgc3RhdGljIGludCBleHRlbnRfd3JpdGVfY2Fj
aGVfcGFnZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCQkgICAgICAgJkJU
UkZTX0koaW5vZGUpLT5ydW50aW1lX2ZsYWdzKSkKPiAgIAkJd2JjLT50YWdnZWRfd3JpdGVwYWdl
cyA9IDE7Cj4gICAKPiAtCWlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMt
PnRhZ2dlZF93cml0ZXBhZ2VzKQo+IC0JCXRhZyA9IFBBR0VDQUNIRV9UQUdfVE9XUklURTsKPiAt
CWVsc2UKPiAtCQl0YWcgPSBQQUdFQ0FDSEVfVEFHX0RJUlRZOwo+ICsJdGFnID0gd2JjX3RvX3Rh
Zyh3YmMpOwo+ICAgcmV0cnk6Cj4gICAJaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxM
IHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gICAJCXRhZ19wYWdlc19mb3Jfd3JpdGViYWNr
KG1hcHBpbmcsIGluZGV4LCBlbmQpOwo+IGRpZmYgLS1naXQgYS9mcy9jZXBoL2FkZHIuYyBiL2Zz
L2NlcGgvYWRkci5jCj4gaW5kZXggMzIyZWQyNjhmMTRhLi42M2I3NWQyMTQyMTAgMTAwNjQ0Cj4g
LS0tIGEvZnMvY2VwaC9hZGRyLmMKPiArKysgYi9mcy9jZXBoL2FkZHIuYwo+IEBAIC0xMDQ1LDEx
ICsxMDQ1LDcgQEAgdm9pZCBjZXBoX2luaXRfd3JpdGViYWNrX2N0bChzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZywKPiAgIAljZXBoX3diYy0+aW5kZXggPSBjZXBoX3diYy0+c3RhcnRfaW5k
ZXg7Cj4gICAJY2VwaF93YmMtPmVuZCA9IC0xOwo+ICAgCj4gLQlpZiAod2JjLT5zeW5jX21vZGUg
PT0gV0JfU1lOQ19BTEwgfHwgd2JjLT50YWdnZWRfd3JpdGVwYWdlcykgewo+IC0JCWNlcGhfd2Jj
LT50YWcgPSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4gLQl9IGVsc2Ugewo+IC0JCWNlcGhfd2Jj
LT50YWcgPSBQQUdFQ0FDSEVfVEFHX0RJUlRZOwo+IC0JfQo+ICsJY2VwaF93YmMtPnRhZyA9IHdi
Y190b190YWcod2JjKTsKPiAgIAo+ICAgCWNlcGhfd2JjLT5vcF9pZHggPSAtMTsKPiAgIAljZXBo
X3diYy0+bnVtX29wcyA9IDA7Cj4gZGlmZiAtLWdpdCBhL2ZzL2V4dDQvaW5vZGUuYyBiL2ZzL2V4
dDQvaW5vZGUuYwo+IGluZGV4IDViN2ExNWRiNDk1My4uMTk2ZWJhN2ZhMzljIDEwMDY0NAo+IC0t
LSBhL2ZzL2V4dDQvaW5vZGUuYwo+ICsrKyBiL2ZzL2V4dDQvaW5vZGUuYwo+IEBAIC0yNjE5LDEw
ICsyNjE5LDcgQEAgc3RhdGljIGludCBtcGFnZV9wcmVwYXJlX2V4dGVudF90b19tYXAoc3RydWN0
IG1wYWdlX2RhX2RhdGEgKm1wZCkKPiAgIAloYW5kbGVfdCAqaGFuZGxlID0gTlVMTDsKPiAgIAlp
bnQgYnBwID0gZXh0NF9qb3VybmFsX2Jsb2Nrc19wZXJfZm9saW8obXBkLT5pbm9kZSk7Cj4gICAK
PiAtCWlmIChtcGQtPndiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IG1wZC0+d2JjLT50
YWdnZWRfd3JpdGVwYWdlcykKPiAtCQl0YWcgPSBQQUdFQ0FDSEVfVEFHX1RPV1JJVEU7Cj4gLQll
bHNlCj4gLQkJdGFnID0gUEFHRUNBQ0hFX1RBR19ESVJUWTsKPiArCXRhZyA9IHdiY190b190YWco
bXBkLT53YmMpOwo+ICAgCj4gICAJbXBkLT5tYXAubV9sZW4gPSAwOwo+ICAgCW1wZC0+bmV4dF9w
b3MgPSBtcGQtPnN0YXJ0X3BvczsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9m
MmZzL2RhdGEuYwo+IGluZGV4IDc5NjFlMGRkZmNhMy4uMTAxZTk2Mjg0NWRiIDEwMDY0NAo+IC0t
LSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtMzAwMywxMCAr
MzAwMyw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9jYWNoZV9wYWdlcyhzdHJ1Y3QgYWRkcmVz
c19zcGFjZSAqbWFwcGluZywKPiAgIAkJaWYgKHdiYy0+cmFuZ2Vfc3RhcnQgPT0gMCAmJiB3YmMt
PnJhbmdlX2VuZCA9PSBMTE9OR19NQVgpCj4gICAJCQlyYW5nZV93aG9sZSA9IDE7Cj4gICAJfQo+
IC0JaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRl
cGFnZXMpCj4gLQkJdGFnID0gUEFHRUNBQ0hFX1RBR19UT1dSSVRFOwo+IC0JZWxzZQo+IC0JCXRh
ZyA9IFBBR0VDQUNIRV9UQUdfRElSVFk7Cj4gKwl0YWcgPSB3YmNfdG9fdGFnKHdiYyk7Cj4gICBy
ZXRyeToKPiAgIAlyZXRyeSA9IDA7Cj4gICAJaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNf
QUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMpCj4gZGlmZiAtLWdpdCBhL2ZzL2dmczIvYW9w
cy5jIGIvZnMvZ2ZzMi9hb3BzLmMKPiBpbmRleCA0N2Q3NGFmZDYzYWMuLjEyMzk0ZmM1ZGQyOSAx
MDA2NDQKPiAtLS0gYS9mcy9nZnMyL2FvcHMuYwo+ICsrKyBiL2ZzL2dmczIvYW9wcy5jCj4gQEAg
LTMxMSwxMCArMzExLDcgQEAgc3RhdGljIGludCBnZnMyX3dyaXRlX2NhY2hlX2pkYXRhKHN0cnVj
dCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCQkJcmFuZ2Vfd2hvbGUgPSAxOwo+ICAgCQlj
eWNsZWQgPSAxOyAvKiBpZ25vcmUgcmFuZ2VfY3ljbGljIHRlc3RzICovCj4gICAJfQo+IC0JaWYg
KHdiYy0+c3luY19tb2RlID09IFdCX1NZTkNfQUxMIHx8IHdiYy0+dGFnZ2VkX3dyaXRlcGFnZXMp
Cj4gLQkJdGFnID0gUEFHRUNBQ0hFX1RBR19UT1dSSVRFOwo+IC0JZWxzZQo+IC0JCXRhZyA9IFBB
R0VDQUNIRV9UQUdfRElSVFk7Cj4gKwl0YWcgPSB3YmNfdG9fdGFnKHdiYyk7Cj4gICAKPiAgIHJl
dHJ5Ogo+ICAgCWlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCB8fCB3YmMtPnRhZ2dl
ZF93cml0ZXBhZ2VzKQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3dyaXRlYmFjay5oIGIv
aW5jbHVkZS9saW51eC93cml0ZWJhY2suaAo+IGluZGV4IGEyODQ4ZDczMWE0Ni4uZGRlNzdkMTNh
MjAwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmgKPiArKysgYi9pbmNs
dWRlL2xpbnV4L3dyaXRlYmFjay5oCj4gQEAgLTI0MCw2ICsyNDAsMTMgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGlub2RlX2RldGFjaF93YihzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICAgCX0KPiAgIH0K
PiAgIAo+ICtzdGF0aWMgaW5saW5lIHhhX21hcmtfdCB3YmNfdG9fdGFnKHN0cnVjdCB3cml0ZWJh
Y2tfY29udHJvbCAqd2JjKQo+ICt7Cj4gKwlpZiAod2JjLT5zeW5jX21vZGUgPT0gV0JfU1lOQ19B
TEwgfHwgd2JjLT50YWdnZWRfd3JpdGVwYWdlcykKPiArCQlyZXR1cm4gUEFHRUNBQ0hFX1RBR19U
T1dSSVRFOwo+ICsJcmV0dXJuIFBBR0VDQUNIRV9UQUdfRElSVFk7Cj4gK30KPiArCj4gICB2b2lk
IHdiY19hdHRhY2hfZmRhdGF3cml0ZV9pbm9kZShzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndi
YywKPiAgIAkJc3RydWN0IGlub2RlICppbm9kZSk7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvbW0vcGFn
ZS13cml0ZWJhY2suYyBiL21tL3BhZ2Utd3JpdGViYWNrLmMKPiBpbmRleCAzZTI0OGQxYzM5Njku
LmFlMTE4MWE0NmRlYSAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlLXdyaXRlYmFjay5jCj4gKysrIGIv
bW0vcGFnZS13cml0ZWJhY2suYwo+IEBAIC0yNDM0LDEyICsyNDM0LDYgQEAgc3RhdGljIGJvb2wg
Zm9saW9fcHJlcGFyZV93cml0ZWJhY2soc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4g
ICAJcmV0dXJuIHRydWU7Cj4gICB9Cj4gICAKPiAtc3RhdGljIHhhX21hcmtfdCB3YmNfdG9fdGFn
KHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjKQo+IC17Cj4gLQlpZiAod2JjLT5zeW5jX21v
ZGUgPT0gV0JfU1lOQ19BTEwgfHwgd2JjLT50YWdnZWRfd3JpdGVwYWdlcykKPiAtCQlyZXR1cm4g
UEFHRUNBQ0hFX1RBR19UT1dSSVRFOwo+IC0JcmV0dXJuIFBBR0VDQUNIRV9UQUdfRElSVFk7Cj4g
LX0KPiAgIAo+ICAgc3RhdGljIHBnb2ZmX3Qgd2JjX2VuZChzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRy
b2wgKndiYykKPiAgIHsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
