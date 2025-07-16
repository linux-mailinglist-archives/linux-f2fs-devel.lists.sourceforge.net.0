Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C5B06AF9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 02:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFd7Pm9jDY6/iN1zZhDVCXYCJZjVDlhJSFrRPJUnxW4=; b=PW3oHB0khO53QlnJOFJ7e57EHx
	ZsIMiIcF+5Geq5vGRI0kw3ZLRg+0Dl1OPJDd+BgO/uPnkUYUXRi0/SHlTvhPGrTK4KZPYIeNpl7eT
	oS5xhzMPcDhkQw4NODIpwhxI+Bc61fpL0kfAowjz525ImOJHND/PmYFnUIPNmTkYXNJA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubqSf-0005bI-H9;
	Wed, 16 Jul 2025 00:57:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wqu@suse.com>) id 1ubqSe-0005bB-9A
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 00:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KacZvyW/+D5c+CkKTBWmhK+loj5fkAU60jNANOTBA8M=; b=UBwIulE49sI/gXy+i535cFOebP
 e8SSEWUp1iD/2RtDqxrgwUpFWFk01dI2MWiMdDUx8wCC3BpCJGuXU0StjSDbmBjnHTWIYo8X8/6Jy
 KmotMtxowcuGUu8XEHn40JgHTL9jeTPZAEsCVsyQvGFEjmp1N3IVemBKigo1z0StVZjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KacZvyW/+D5c+CkKTBWmhK+loj5fkAU60jNANOTBA8M=; b=HujITTf930qUGirYJwNBOQKivd
 yVa20UTMXPKIc0OtewEwg6QZZf793flighinzSAzLjrVcaTbMLoWtbzYaJ62EX7rtJOG2nXjW9hpT
 0mVAMkUq3HDnjMqbmeaJxqrVH13IIgoFFixI1mf0h9SlQ80O1HH/KToHOI5GsYomjnMw=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubqSd-0004i8-Q2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 00:57:28 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4525456f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1752627436; x=1753232236; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KacZvyW/+D5c+CkKTBWmhK+loj5fkAU60jNANOTBA8M=;
 b=fLsCUqe8mycPUhhCS5F54AHX2rEo8nhry7ymtbx8aBkoqCaYzub7Po2tmMK94LLwB1
 yvSax6mT/GVUbyA/+A+F9CuVDQDRC4eHLw3S4pYb9c2PkHUI0OUnuKYEVejoZBl8ShkA
 ozoPVWMunLJi2ds2zwb26pUw3tGIaKJ4bQP9WAj2bz/Va5l3a30dAiSowLTfRw8cZ5mv
 GK3QxA0L8iZ0Pm4T5Lh+cy7pFNHmyBWP7BGl7XexA2wuaWejbaj3H7MV5eufZZUl3jl1
 VBcsHqCUKGU8DF+YIqbpnfol9x6wx0cv5lMaGtFTZ0cYgrfXAcIy8dwlLcPQlYcPkJFR
 ErQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752627436; x=1753232236;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KacZvyW/+D5c+CkKTBWmhK+loj5fkAU60jNANOTBA8M=;
 b=WCNVTPzYAlrC/mAymLMOO7v2eA8dJL4Y3LU2Bxg6jEko0TXq6atCg9/1dePHYC8Qb1
 3sBgBq5tGI8E/OzPYZWwf2fKBLUbhtBrHSW4TCWGZzK4LvCP4KKu0mZ1ZhviIpW2bKXk
 W+zXBp1G27jEJcSs1PdWmTQmFQAKMRvbvQc+LB/MReJahh0/aV+zghyedSkM2dFfYFLy
 x8+LlGTsnerZULE9/bRelC170vx7CsoaSKNZfLF1kcNXGP0bH3l9WgdlQ2QGDA5aUhB2
 h0/GwDfxInm+2w4jqihZ28J48gZI5z26sC3NB5RbtXU2fcs1/3hvDWgGr1NyUXYDepUh
 RsrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+vPzHmTWCEio2N1skJGSk+9m9cbmGQr5Pj2FBxDdfBTbxOXRkCQ5zqE1aQ+mubNSTvHabfjPgDxLVaBklsi2B@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwCr83ONfpmPoKzUsTux6QYFvGLCKJLklqulSc4imSM2M789SqC
 qw4FNG3er/c6k8pTMtqcYNGZDImPq9P+t0WBGlAtSWsOh5zyKZfaklK2si6ZnxoQ/ic=
X-Gm-Gg: ASbGncsEYl8s0WJvojacDxTpmEmDMowPr7UI1MujpguWPYnZsx0Fa4OfhhrX6B5ugaC
 upuSkpRiZvayOzw6hZ4k8egmAkvTKkwoKVFJYUHtZpqbKlMgGWGng8WRrAUCvuCzfD7VLI8MEd4
 xpkBtplVcheYIyVNPM57dfJHFkz5U2Lm+uCRls6RltJWXnZCtg3DBxFlBaD8aIq70LTBrs5YxPm
 jDr7vA5tVdWCJpn7bJEzjvgfHgp3uEFmeypsawkDzB9i88Nj50dBlTQAk0T8HoHwioVmNqGAYtz
 BCc+uOqd1aLOMgCiDLyPgXWj7QI1N4yqKbL0YNZVyHKozU48/p+zag7Emh0iSB+lzrRiOHMXIq1
 KYH2J7YeG8wutG6HlD5wznRqR2AffpIFPgowfDbCBy3uOJbGn7w==
X-Google-Smtp-Source: AGHT+IGmM0n20dxhtQ6vMPJL8jS+hYaNOO5Rpe4CXLe7RvspyCFw9ZMsMSHoEA6/McxI5CdSoNbUKg==
X-Received: by 2002:a05:6000:3ce:b0:3b6:d6d:dd2 with SMTP id
 ffacd0b85a97d-3b60e4cb532mr348001f8f.25.1752627436011; 
 Tue, 15 Jul 2025 17:57:16 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299?
 (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4332cdcsm114942995ad.145.2025.07.15.17.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 17:57:15 -0700 (PDT)
Message-ID: <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
Date: Wed, 16 Jul 2025 10:27:05 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
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
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/16 06:10, Matthew Wilcox 写道: > I've started
    looking at how the page cache can help filesystems handle > compressed data
    better. Feedback would be appreciated! I'll probably > say a few [...] 
 
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
                             [209.85.221.47 listed in wl.mailspike.net]
X-Headers-End: 1ubqSd-0004i8-Q2
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

CgrlnKggMjAyNS83LzE2IDA2OjEwLCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4gSSd2ZSBzdGFy
dGVkIGxvb2tpbmcgYXQgaG93IHRoZSBwYWdlIGNhY2hlIGNhbiBoZWxwIGZpbGVzeXN0ZW1zIGhh
bmRsZQo+IGNvbXByZXNzZWQgZGF0YSBiZXR0ZXIuICBGZWVkYmFjayB3b3VsZCBiZSBhcHByZWNp
YXRlZCEgIEknbGwgcHJvYmFibHkKPiBzYXkgYSBmZXcgdGhpbmdzIHdoaWNoIGFyZSBvYnZpb3Vz
IHRvIGFueW9uZSB3aG8ga25vd3MgaG93IGNvbXByZXNzZWQKPiBmaWxlcyB3b3JrLCBidXQgSSdt
IHRyeWluZyB0byBiZSBleHBsaWNpdCBhYm91dCBteSBhc3N1bXB0aW9ucy4KPiAKPiBGaXJzdCwg
SSBiZWxpZXZlIHRoYXQgYWxsIGZpbGVzeXN0ZW1zIHdvcmsgYnkgY29tcHJlc3NpbmcgZml4ZWQt
c2l6ZQo+IHBsYWludGV4dCBpbnRvIHZhcmlhYmxlLXNpemVkIGNvbXByZXNzZWQgYmxvY2tzLiAg
VGhpcyB3b3VsZCBiZSBhIGdvb2QKPiBwb2ludCB0byBzdG9wIHJlYWRpbmcgYW5kIHRlbGwgbWUg
YWJvdXQgY291bnRlcmV4YW1wbGVzLgoKSSBkb24ndCB0aGluayBpdCdzIHRoZSBjYXNlIGZvciBi
dHJmcywgdW5sZXNzIHlvdXIgImZpeGVkLXNpemUiIG1lYW5zIApibG9jayBzaXplLCBhbmQgaW4g
dGhhdCBjYXNlLCBhIHNpbmdsZSBibG9jayB3b24ndCBiZSBjb21wcmVzc2VkIGF0IGFsbC4uLgoK
SW4gYnRyZnMsIHdlIHN1cHBvcnQgY29tcHJlc3NpbmcgdGhlIHBsYWludGV4dCBmcm9tIDIgYmxv
Y2tzIHRvIDEyOEtpQiAKKHRoZSAxMjhLaUIgbGltaXQgaXMgYW4gYXJ0aWZpY2lhbCBvbmUpLgoK
PiAKPiAgRnJvbSB3aGF0IEkndmUgYmVlbiByZWFkaW5nIGluIGFsbCB5b3VyIGZpbGVzeXN0ZW1z
IGlzIHRoYXQgeW91IHdhbnQgdG8KPiBhbGxvY2F0ZSBleHRyYSBwYWdlcyBpbiB0aGUgcGFnZSBj
YWNoZSBpbiBvcmRlciB0byBzdG9yZSB0aGUgZXhjZXNzIGRhdGEKPiByZXRyaWV2ZWQgYWxvbmcg
d2l0aCB0aGUgcGFnZSB0aGF0IHlvdSdyZSBhY3R1YWxseSB0cnlpbmcgdG8gcmVhZC4gIFRoYXQn
cwo+IGJlY2F1c2UgY29tcHJlc3NpbmcgaW4gbGFyZ2VyIGNodW5rcyBsZWFkcyB0byBiZXR0ZXIg
Y29tcHJlc3Npb24uCgpXZSBkb24ndC4gV2UganVzdCBncmFiIGRpcnR5IHBhZ2VzIHVwIHRvIDEy
OEtpQiwgYW5kIHdlIGNhbiBoYW5kbGUgCnNtYWxsZXIgcmFuZ2VzLCBhcyBzbWFsbCBhcyB0d28g
YmxvY2tzLgoKPiAKPiBUaGVyZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVt
cyB3aGV0aGVyIHlvdSBuZWVkIHNjcmF0Y2gKPiBzcGFjZSBmb3IgZGVjb21wcmVzc2lvbi4gIFNv
bWUgZmlsZXN5c3RlbXMgcmVhZCB0aGUgY29tcHJlc3NlZCBkYXRhIGludG8KPiB0aGUgcGFnZWNh
Y2hlIGFuZCBkZWNvbXByZXNzIGluLXBsYWNlLCB3aGlsZSBvdGhlciBmaWxlc3lzdGVtcyByZWFk
IHRoZQo+IGNvbXByZXNzZWQgZGF0YSBpbnRvIHNjcmF0Y2ggcGFnZXMgYW5kIGRlY29tcHJlc3Mg
aW50byB0aGUgcGFnZSBjYWNoZS4KCkJ0cmZzIGdvZXMgdGhlIHNjcmF0Y2ggcGFnZXMgd2F5LiBE
ZWNvbXByZXNzaW9uIGluLXBsYWNlIGxvb2tzIGEgbGl0dGxlIAp0cmlja3kgdG8gbWUuIEUuZy4g
d2hhdCBpZiB0aGVyZSBpcyBvbmx5IG9uZSBjb21wcmVzc2VkIHBhZ2UsIGFuZCBpdCAKZGVjb21w
cmVzc2VkIHRvIDQgcGFnZXMuCgpXb24ndCB0aGUgcGxhaW50ZXh0IG92ZXItd3JpdGUgdGhlIGNv
bXByZXNzZWQgZGF0YSBoYWxmd2F5PwoKPiAKPiBUaGVyZSBhbHNvIHNlZW1zIHRvIGJlIHNvbWUg
ZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVtcyB3aGV0aGVyIHRoZQo+IGRlY29tcHJlc3Np
b24gaW52b2x2ZXMgdm1hcCgpIG9mIGFsbCB0aGUgbWVtb3J5IGFsbG9jYXRlZCBvciB3aGV0aGVy
IHRoZQo+IGRlY29tcHJlc3Npb24gcm91dGluZXMgY2FuIGhhbmRsZSBkb2luZyBrbWFwX2xvY2Fs
KCkgb24gaW5kaXZpZHVhbCBwYWdlcy4KCkJ0cmZzIGlzIHRoZSBsYXRlciBjYXNlLgoKQWxsIHRo
ZSBkZWNvbXByZXNzaW9uL2NvbXByZXNzaW9uIHJvdXRpbmVzIGFsbCBzdXBwb3J0IHN3YXBwaW5n
IAppbnB1dC9vdXRwdXQgYnVmZmVyIHdoZW4gb25lIG9mIHRoZW0gaXMgZnVsbC4KU28ga21hcF9s
b2NhbCgpIGlzIGNvbXBsZXRlbHkgZmVhc2libGUuCgpUaGFua3MsClF1Cgo+IAo+IFNvLCBteSBw
cm9wb3NhbCBpcyB0aGF0IGZpbGVzeXN0ZW1zIHRlbGwgdGhlIHBhZ2UgY2FjaGUgdGhhdCB0aGVp
ciBtaW5pbXVtCj4gZm9saW8gc2l6ZSBpcyB0aGUgY29tcHJlc3Npb24gYmxvY2sgc2l6ZS4gIFRo
YXQgc2VlbXMgdG8gYmUgYXJvdW5kIDY0aywKPiBzbyBub3QgYW4gdW5yZWFzb25hYmxlIG1pbmlt
dW0gYWxsb2NhdGlvbiBzaXplLiAgVGhhdCByZW1vdmVzIGFsbCB0aGUKPiBleHRyYSBjb2RlIGlu
IGZpbGVzeXN0ZW1zIHRvIGFsbG9jYXRlIGV4dHJhIG1lbW9yeSBpbiB0aGUgcGFnZSBjYWNoZS4K
PiBJdCBtZWFucyB3ZSBkb24ndCBhdHRlbXB0IHRvIHRyYWNrIGRpcnRpbmVzcyBhdCBhIHN1Yi1m
b2xpbyBncmFudWxhcml0eQo+ICh0aGVyZSdzIG5vIHBvaW50LCB3ZSBoYXZlIHRvIHdyaXRlIGJh
Y2sgdGhlIGVudGlyZSBjb21wcmVzc2VkIGJvY2sKPiBhdCBvbmNlKS4gIFdlIGFsc28gZ2V0IGEg
c2luZ2xlIHZpcnR1YWxseSBjb250aWd1b3VzIGJsb2NrIC4uLiBpZiB5b3UncmUKPiB3aWxsaW5n
IHRvIGRpdGNoIEhJR0hNRU0gc3VwcG9ydC4gIE9yIHRoZXJlJ3MgYSBwcm9wb3NhbCB0byBpbnRy
b2R1Y2UgYQo+IHZtYXBfZmlsZSgpIHdoaWNoIHdvdWxkIGdpdmUgdXMgYSB2aXJ0dWFsbHkgY29u
dGlndW91cyBjaHVuayBvZiBtZW1vcnkKPiAoYW5kIGNvdWxkIGJlIHRyaXZpYWxseSB0dXJuZWQg
aW50byBhIG5vb3AgZm9yIHRoZSBjYXNlIG9mIHRyeWluZyB0bwo+IHZtYXAgYSBzaW5nbGUgbGFy
Z2UgZm9saW8pLgo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
