Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69AB06CDE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 06:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vXsGrjkwmhREvTuQ2eA0Wh8lPVmwgdxWNNxJk5b98w=; b=Og0qFFwSaYZj+Vf1nG0ch+gjww
	ijdynDQeThVfuCkYBXWCWpAokwsqgzz8kUl1NRQq4+akEL8KsflmwZVnMaiR8z9C8UeAzQDMhbI2j
	IhEPCxsKWF+NnSDkJbF2MvlxHgp2Gdon25w2TQ0bAuGdvVLAW/Fl7c6bDz5HEKmRkFZw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubuAt-0003gL-E7;
	Wed, 16 Jul 2025 04:55:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wqu@suse.com>) id 1ubuAr-0003gE-P3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 04:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUlf376OMv1XrkJW2oCmSZAdKifpL8InJUYTeCpUwoM=; b=BqTxU93U4sl/oErP2ksP8kG4n5
 MAl1YB4lgANirUbdt9hJJ9a+NrvTVxI52rSU88UUPjNGbgJnT9X2e9iMx1EtuF3QGL/ijOMxDXKfC
 JwQ0Q3Ax3r5TuztCd2vhXRyoNCm3Gt0J0aoP1m7bWRlbx3VtBDZ6hqxJoRqvwr+VAvuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUlf376OMv1XrkJW2oCmSZAdKifpL8InJUYTeCpUwoM=; b=Y/Bunbbaw/G/mmsUX63cUhjmc6
 roIRCJvufu1U856u5aM4mLskwqxyrjapESyG2f+Ms7fJeFD1CzRpMlksYAi5RUzntQsHrASd5hNlK
 dmVw10Y37ZIusrvFuoeEqmmg4TnNCg59VRVDRdw6z4o/UixJ1ZWfXK4USyuN4tr2Av3E=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubuAr-0008D3-8H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 04:55:21 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so22116055e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 21:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1752641710; x=1753246510; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KUlf376OMv1XrkJW2oCmSZAdKifpL8InJUYTeCpUwoM=;
 b=FsSEj7uNHXvHFlqHks3+WB9Q4dTtkYY7Jb5p0lVqwafE/2pMlPJUOJZowaCxxG412F
 y5BWM/cILkyZZIyEvFgCKtf5utTmgUamid5PPOY9Z0vy39g8mz1z+VqBlRP9linKbNo8
 KDiit3GGViOaUJCMKPyBTHilNx96lPptelh6L90Ne11K8BvlIFx/BIlXw/YBZZkCRmLC
 5fEiIEc8RdKuoMTtBlcnckItuSMOGh2INOTj2aSWphngM3LcXfB2iIfXNVFeP1tX28XU
 19WERrRVqYNhZILK+TFutpfqFXV9DUnx9BpM0qVbWXwEhE3Dbb8EjwgHqrB8+AqQB3NC
 p5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752641710; x=1753246510;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUlf376OMv1XrkJW2oCmSZAdKifpL8InJUYTeCpUwoM=;
 b=orlKNOAnYYPV+3i/xUQF2EyTg3YqCM2DgZtdxAzeiGJQR7SDWy0lNspSeDSTyxDLo4
 JHMr4ArRauiGo1Nye9ax7JU9zWWXSS2b4SQ/xis5a/dAZpslkCyR7lMVcH9fUZKxnONG
 T2qSVMUo/SPaxe4viD7auQQm0mB7mqHjW4zL3yPRDEODIzBFEBtm54J6B5U2ziDF5I9J
 d9U1nGk7auP68wyHZD5lVsnKdToR0dn0jdpoPe5u00Yi+wliu/TS9uJk3nflFsW/Avk7
 X8BL2GaTb6j9G1w7P7KLrAGYF18e4vnne7rA969rq/xcdxo5aZNADT4vlnJ+4FnKZdXY
 Duwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ordTG0AdiLNexlayOqU0q06xvahmUPi1BJC58VJPGhHYH45QgOF9MrdlB8/IBjHaij50wVzlj+L4bMUbuJRD@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxJFG37fJGVcwFn5e0GZspyyYqgDmN6oPvEY9kpGLOa9O+Dn84W
 u8UKaCePbGzo42T0SRFNUyMbqz99E2DgFdZBdohALJyR13SLHCK3dvaWg9wKnx0idB4=
X-Gm-Gg: ASbGncs8avmx9RA9GdJPnk+SKHT20HlEU5ehlHFaH79GYDsB92rvJzVa8Fzv2ck/gRC
 6Vv/onFbIVBawlNwAw31BqNgFkFfzTp7iHWJQ8qhNC9hNllPoBqjRVeNhmXGIZRP7YYhFuIgTMX
 6l50z8wSiQfuuwclGsURuqnCO/N6y8SwuQXanRIQEy677W2+PYfBmEeuWSuZmDXPN1OWY4KWLIV
 bAiMGi3xBvXHvHrqDUIPYzGmvgUd3LEWtb2aDY2hPrcn7QeTsjwHt0ZyHLR+xnBtjDGxxuHXa4E
 md5DYQbQ4KqJK/ADJcX3hcXJmnXS9P9yDGjTRVhWIlB+0DDfSdN5rQ/SYCumzsn9kvQkaOw0Wjd
 wv9rVmCtf1b0MquAI4Tw5Otumo9GvI5B5QJW0ry47fI0UKQ6NmA==
X-Google-Smtp-Source: AGHT+IGQoacjNokIlv9kK4wCibwhRBT2cyuhZxnrQDEDj6ZSWUyIJyb34LpzcuPXzslTfEZGpbv7Yw==
X-Received: by 2002:a5d:5f50:0:b0:3a4:d53d:be20 with SMTP id
 ffacd0b85a97d-3b60dd54803mr1041332f8f.18.1752641709469; 
 Tue, 15 Jul 2025 21:55:09 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299?
 (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ec6b4cda5sm11051963b3a.108.2025.07.15.21.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 21:55:08 -0700 (PDT)
Message-ID: <b43fe06d-204b-4f47-a7ff-0c405365bc48@suse.com>
Date: Wed, 16 Jul 2025 14:24:58 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gao Xiang <hsiangkao@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
 <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
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
In-Reply-To: <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/16 10:46, Gao Xiang 写道: > ... > >> >>> >>>
    There's some discrepancy between filesystems whether you need scratch >>>
    space for decompression. Some filesystems read the compressed data i [...]
    
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.48 listed in wl.mailspike.net]
X-Headers-End: 1ubuAr-0008D3-8H
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzE2IDEwOjQ2LCBHYW8gWGlhbmcg5YaZ6YGTOgo+IC4uLgo+IAo+Pgo+Pj4K
Pj4+IFRoZXJlJ3Mgc29tZSBkaXNjcmVwYW5jeSBiZXR3ZWVuIGZpbGVzeXN0ZW1zIHdoZXRoZXIg
eW91IG5lZWQgc2NyYXRjaAo+Pj4gc3BhY2UgZm9yIGRlY29tcHJlc3Npb24uwqAgU29tZSBmaWxl
c3lzdGVtcyByZWFkIHRoZSBjb21wcmVzc2VkIGRhdGEgaW50bwo+Pj4gdGhlIHBhZ2VjYWNoZSBh
bmQgZGVjb21wcmVzcyBpbi1wbGFjZSwgd2hpbGUgb3RoZXIgZmlsZXN5c3RlbXMgcmVhZCB0aGUK
Pj4+IGNvbXByZXNzZWQgZGF0YSBpbnRvIHNjcmF0Y2ggcGFnZXMgYW5kIGRlY29tcHJlc3MgaW50
byB0aGUgcGFnZSBjYWNoZS4KPj4KPj4gQnRyZnMgZ29lcyB0aGUgc2NyYXRjaCBwYWdlcyB3YXku
IERlY29tcHJlc3Npb24gaW4tcGxhY2UgbG9va3MgYSAKPj4gbGl0dGxlIHRyaWNreSB0byBtZS4g
RS5nLiB3aGF0IGlmIHRoZXJlIGlzIG9ubHkgb25lIGNvbXByZXNzZWQgcGFnZSwgCj4+IGFuZCBp
dCBkZWNvbXByZXNzZWQgdG8gNCBwYWdlcy4KPiAKPiBEZWNvbXByZXNzaW9uIGluLXBsYWNlIG1h
aW5seSBvcHRpbWl6ZXMgZnVsbCBkZWNvbXByZXNzaW9uIChzbyB0aGF0IENQVQo+IGNhY2hlIGxp
bmUgd29uJ3QgYmUgcG9sbHV0ZWQgYnkgdGVtcG9yYXJ5IGJ1ZmZlcnMgZWl0aGVyKSwgaW4gZmFj
dCwKPiBFUk9GUyBzdXBwb3J0cyB0aGUgaHliaXJkIHdheS4KPiAKPj4KPj4gV29uJ3QgdGhlIHBs
YWludGV4dCBvdmVyLXdyaXRlIHRoZSBjb21wcmVzc2VkIGRhdGEgaGFsZndheT8KPiAKPiBQZXJz
b25hbGx5IEknbSB2ZXJ5IGZhbWlsaWFyIHdpdGggTFo0LCBMWk1BLCBhbmQgREVGTEFURQo+IGFs
Z29yaXRobSBpbnRlcm5hbHMsIGFuZCBJIGFsc28gaGF2ZSBleHBlcmllbmNlIHRvIGJ1aWxkIExa
TUEsCj4gREVGTEFURSBjb21wcmVzc29ycy4KPiAKPiBJdCdzIHRvdGFsbHkgd29ya2FibGUgZm9y
IExaNCwgaW4gc2hvcnQgaXQgd2lsbCByZWFkIHRoZSBjb21wcmVzc2VkCj4gZGF0YSBhdCB0aGUg
ZW5kIG9mIHRoZSBkZWNvbXByZXNzZWQgYnVmZmVycywgYW5kIHRoZSBwcm9wZXIgbWFyZ2luCj4g
Y2FuIG1ha2UgdGhpcyBhbG1vc3QgYWx3YXlzIHN1Y2NlZWQuCgpJIGd1ZXNzIHRoYXQncyB3aHkg
YnRyZnMgY2FuIG5vdCBnbyB0aGF0IHdheS4KCkR1ZSB0byBkYXRhIENPVywgd2UncmUgdG90YWxs
eSBwb3NzaWJsZSB0byBoaXQgYSBjYXNlIHRoYXQgd2Ugb25seSB3YW50IAp0byByZWFkIG91dCBv
bmUgc2luZ2xlIHBsYWludGV4dCBibG9jayBmcm9tIGEgY29tcHJlc3NlZCBkYXRhIGV4dGVudCAK
KHRoZSBjb21wcmVzc2VkIHNpemUgY2FuIGV2ZW4gYmUgbGFyZ2VyIHRoYW4gb25lIGJsb2NrKS4K
CkluIHRoYXQgY2FzZSBzdWNoIGluLXBsYWNlIGRlY29tcHJlc3Npb24gd2lsbCBkZWZpbml0ZWx5
IG5vdCB3b3JrLgoKWy4uLl0KCj4+IEFsbCB0aGUgZGVjb21wcmVzc2lvbi9jb21wcmVzc2lvbiBy
b3V0aW5lcyBhbGwgc3VwcG9ydCBzd2FwcGluZyBpbnB1dC8gCj4+IG91dHB1dCBidWZmZXIgd2hl
biBvbmUgb2YgdGhlbSBpcyBmdWxsLgo+PiBTbyBrbWFwX2xvY2FsKCkgaXMgY29tcGxldGVseSBm
ZWFzaWJsZS4KPiAKPiBJIHRoaW5rIG9uZSBvZiB0aGUgYnRyZnMgc3VwcG9ydGVkIGFsZ29yaXRo
bSBMWk8gaXMgbm90LAoKSXQgaXMsIHRoZSB0cmlja3kgcGFydCBpcyBidHJmcyBpcyBpbXBsZW1l
bnRpbmcgaXRzIG93biBUTFYgc3RydWN0dXJlIApmb3IgTFpPIGNvbXByZXNzaW9uLgoKQW5kIGJ0
cmZzIGRvZXMgZXh0cmEgcGFkZGluZyB0byBlbnN1cmUgbm8gVExWIChjb21wcmVzc2VkIGRhdGEg
KyBoZWFkZXIpIApzdHJ1Y3R1cmUgd2lsbCBjcm9zcyBibG9jayBib3VuZGFyeS4KClNvIGJ0cmZz
IExaTyBjb21wcmVzc2lvbiBpcyBzdGlsbCBhYmxlIHRvIHN3YXAgb3V0IGlucHV0L291dHB1dCBo
YWxmd2F5LCAKbW9zdGx5IGR1ZSB0byB0aGUgYnRyZnMnIHNwZWNpZmljIGRlc2lnbi4KClRoYW5r
cywKUXUKCj4gYmVjYXVzZSB0aGUKPiBmYXN0ZXN0IExaNzctZmFtaWx5IGFsZ29yaXRobXMgbGlr
ZSBMWjQsIExaTyBqdXN0IG9wZXJhdGVzIG9uIHZpcnR1YWwKPiBjb25zZWN1dGl2ZSBidWZmZXJz
IGFuZCB0cmVhdCB0aGUgZGVjb21wcmVzc2VkIGJ1ZmZlciBhcyBMWjc3IHNsaWRpbmcKPiB3aW5k
b3cuCj4gCj4gU28gdGhhdCBlaXRoZXIgeW91IG5lZWQgdG8gYWxsb2NhdGUgYW5vdGhlciB0ZW1w
b3JhcnkgY29uc2VjdXRpdmUKPiBidWZmZXIgKEkgYmVsaWV2ZSB0aGF0IGlzIHdoYXQgYnRyZnMg
ZG9lcykgb3IgdXNlIHZtYXAoKSBhcHByb2FjaCwKPiBFUk9GUyBpcyBpbnRlcmVzdGVkIGluIHRo
ZSB2bWFwKCkgb25lLgo+IAo+IFRoYW5rcywKPiBHYW8gWGlhbmcKPiAKPj4KPj4gVGhhbmtzLAo+
PiBRdQo+Pgo+Pj4KPj4+IFNvLCBteSBwcm9wb3NhbCBpcyB0aGF0IGZpbGVzeXN0ZW1zIHRlbGwg
dGhlIHBhZ2UgY2FjaGUgdGhhdCB0aGVpciAKPj4+IG1pbmltdW0KPj4+IGZvbGlvIHNpemUgaXMg
dGhlIGNvbXByZXNzaW9uIGJsb2NrIHNpemUuwqAgVGhhdCBzZWVtcyB0byBiZSBhcm91bmQgNjRr
LAo+Pj4gc28gbm90IGFuIHVucmVhc29uYWJsZSBtaW5pbXVtIGFsbG9jYXRpb24gc2l6ZS7CoCBU
aGF0IHJlbW92ZXMgYWxsIHRoZQo+Pj4gZXh0cmEgY29kZSBpbiBmaWxlc3lzdGVtcyB0byBhbGxv
Y2F0ZSBleHRyYSBtZW1vcnkgaW4gdGhlIHBhZ2UgY2FjaGUuCj4+PiBJdCBtZWFucyB3ZSBkb24n
dCBhdHRlbXB0IHRvIHRyYWNrIGRpcnRpbmVzcyBhdCBhIHN1Yi1mb2xpbyBncmFudWxhcml0eQo+
Pj4gKHRoZXJlJ3Mgbm8gcG9pbnQsIHdlIGhhdmUgdG8gd3JpdGUgYmFjayB0aGUgZW50aXJlIGNv
bXByZXNzZWQgYm9jawo+Pj4gYXQgb25jZSkuwqAgV2UgYWxzbyBnZXQgYSBzaW5nbGUgdmlydHVh
bGx5IGNvbnRpZ3VvdXMgYmxvY2sgLi4uIGlmIHlvdSdyZQo+Pj4gd2lsbGluZyB0byBkaXRjaCBI
SUdITUVNIHN1cHBvcnQuwqAgT3IgdGhlcmUncyBhIHByb3Bvc2FsIHRvIGludHJvZHVjZSBhCj4+
PiB2bWFwX2ZpbGUoKSB3aGljaCB3b3VsZCBnaXZlIHVzIGEgdmlydHVhbGx5IGNvbnRpZ3VvdXMg
Y2h1bmsgb2YgbWVtb3J5Cj4+PiAoYW5kIGNvdWxkIGJlIHRyaXZpYWxseSB0dXJuZWQgaW50byBh
IG5vb3AgZm9yIHRoZSBjYXNlIG9mIHRyeWluZyB0bwo+Pj4gdm1hcCBhIHNpbmdsZSBsYXJnZSBm
b2xpbykuCj4+Pgo+Pj4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
