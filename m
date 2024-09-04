Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAC96C1BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 17:07:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slray-0002up-Qu;
	Wed, 04 Sep 2024 15:06:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slrax-0002ug-GB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 15:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MxjlD9EBhZCNeubl13XKXUO+UE1BKy/Ig+l6tuzAqWo=; b=kHNqNysy9qgAgbhLcywT9oYE4S
 Wh6DMDAyTJlZNcFQOufDgz7N/jbUEGputJOp+k8INS0Tbw4TR/5YH4+RJZey61Q8ORi73i1txvR6X
 cHY7adflwjbzMrDnZtylBd0kGNGEsrYHn4BGn1pQnJmVa+F7JDvCO3SQE1jmxaTfMhRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MxjlD9EBhZCNeubl13XKXUO+UE1BKy/Ig+l6tuzAqWo=; b=e1KPvB54nnV/hxw8gd7vgX7zWA
 WXsoyQ/XlarqcMrH+XorITUnOGWxOmJOFQ5NYJJL628m0yZafW1NF9Vf9G+Co/cb8VvGhL3rD4tHH
 OU4DDn26JTDXl9eEnPIlBZ/XlbDjtuPYP+Kg2ca6J/+21hncAQ371iQZedaisQGjjA+A=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slrax-0008TK-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 15:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F235A44445;
 Wed,  4 Sep 2024 15:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6DEC4CEC2;
 Wed,  4 Sep 2024 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725462404;
 bh=TEfrXJ4O9S3AYRQMn8oDiwOTMf8cw1Cvb2GbkdyH7hw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IHls62bu3EvxbI3Rd3MHvEmNOWikLGivHvIHcJpS80WCcIyVsTXffgBf1u6meZRrE
 McvKPo4xOu2OWjwJrKwFcQWq5MLLU0FOBerhCq/D277VKznfJIVyUu1wSXoEXkudGc
 06J5gG9S/+w66xjMQHSEGYE0y2xM/4vdQx+ZjU3p8tiRD6clGigxjug2tK773V479f
 4iwQO2RjKbXtKhoXw/UzJ0dsYEztmuw3TvIl563pOo/lPLYf6rEnRfzylUCsuqRr7M
 /Bhs0wgsOHl7eP1URUxVo5JvQiQMpnWCCTFj9l6eH1mZoXrnvAlO4+93gMjpiSyxb7
 YKRRr1LYLkNAw==
Message-ID: <db0f8aef-a5af-4da9-b6ae-4fb60d0bfc4f@kernel.org>
Date: Wed, 4 Sep 2024 23:06:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240828165425.324845-1-sunjunchao2870@gmail.com>
 <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
 <8edbc0b87074fb9adcccb8b67032dc3a693c9bfa.camel@gmail.com>
 <b20810a7-e8b3-4478-9805-624a33d70b09@kernel.org>
 <Ztd9iJI4ubmpc0_T@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 xsFNBFYs6bUBEADJuxYGZRMvAEySns+DKVtVQRKDYcHlmj+s9is35mtlhrLyjm35FWJY099R
 6DL9bp8tAzLJOMBn9RuTsu7hbRDErCCTiyXWAsFsPkpt5jgTOy90OQVyTon1i/fDz4sgGOrL
 1tUfcx4m5i5EICpdSuXm0dLsC5lFB2KffLNw/ZfRuS+nNlzUm9lomLXxOgAsOpuEVps7RdYy
 UEC81IYCAnweojFbbK8U6u4Xuu5DNlFqRFe/MBkpOwz4Nb+caCx4GICBjybG1qLl2vcGFNkh
 eV2i8XEdUS8CJP2rnp0D8DM0+Js+QmAi/kNHP8jzr7CdG5tje1WIVGH6ec8g8oo7kIuFFadO
 kwy6FSG1kRzkt4Ui2d0z3MF5SYgA1EWQfSqhCPzrTl4rJuZ72ZVirVxQi49Ei2BI+PQhraJ+
 pVXd8SnIKpn8L2A/kFMCklYUaLT8kl6Bm+HhKP9xYMtDhgZatqOiyVV6HFewfb58HyUjxpza
 1C35+tplQ9klsejuJA4Fw9y4lhdiFk8y2MppskaqKg950oHiqbJcDMEOfdo3NY6/tXHFaeN1
 etzLc1N3Y0pG8qS/mehcIXa3Qs2fcurIuLBa+mFiFWrdfgUkvicSYqOimsrE/Ezw9hYhAHq4
 KoW4LQoKyLbrdOBJFW0bn5FWBI4Jir1kIFHNgg3POH8EZZDWbQARAQABzRlDaGFvIFl1IDxj
 aGFvQGtlcm5lbC5vcmc+wsF3BBMBCgAhBQJWLOm1AhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4B
 AheAAAoJEKTPgB1/p52Gm2MP/0zawCU6QN7TZuJ8R1yfdhYr0cholc8ZuPoGim69udQ3otet
 wkTNARnpuK5FG5la0BxFKPlazdgAU1pt+dTzCTS6a3/+0bXYQ5DwOeBPRWeFFklm5Frmk8sy
 wSTxxEty0UBMjzElczkJflmCiDfQunBpWGy9szn/LZ6jjIVK/BiR7CgwXTdlvKcCEkUlI7MD
 vTj/4tQ3y4Vdx+p7P53xlacTzZkP+b6D2VsjK+PsnsPpKwaiPzVFMUwjt1MYtOupK4bbDRB4
 NIFSNu2HSA0cjsu8zUiiAvhd/6gajlZmV/GLJKQZp0MjHOvFS5Eb1DaRvoCf27L+BXBMH4Jq
 2XIyBMm+xqDJd7BRysnImal5NnQlKnDeO4PrpFq4JM0P33EgnSOrJuAb8vm5ORS9xgRlshXh
 2C0MeyQFxL6l+zolEFe2Nt2vrTFgjYLsm2vPL+oIPlE3j7ToRlmm7DcAqsa9oYMlVTTnPRL9
 afNyrsocG0fvOYFCGvjfog/V56WFXvy9uH8mH5aNOg5xHB0//oG9vUyY0Rv/PrtW897ySEPh
 3jFP/EDI0kKjFW3P6CfYG/X1eaw6NDfgpzjkCf2/bYm/SZLV8dL2vuLBVV+hrT1yM1FcZotP
 WwLEzdgdQffuQwJHovz72oH8HVHD2yvJf2hr6lH58VK4/zB/iVN4vzveOdzlzsFNBFYs6bUB
 EADZTCTgMHkb6bz4bt6kkvj7+LbftBt5boKACy2mdrFFMocT5zM6YuJ7Ntjazk5z3F3IzfYu
 94a41kLY1H/G0Y112wggrxem6uAtUiekR9KnphsWI9lRI4a2VbbWUNRhCQA8ag7Xwe5cDIV5
 qb7r7M+TaKaESRx/Y91bm0pL/MKfs/BMkYsr3wA1OX0JuEpV2YHDW8m2nFEGP6CxNma7vzw+
 JRxNuyJcNi+VrLOXnLR6hZXjShrmU88XIU2yVXVbxtKWq8vlOSRuXkLh9NQOZn7mrR+Fb1EY
 DY1ydoR/7FKzRNt6ejI8opHN5KKFUD913kuT90wySWM7Qx9icc1rmjuUDz3VO+rl2sdd0/1h
 Q2VoXbPFxi6c9rLiDf8t7aHbYccst/7ouiHR/vXQty6vSUV9iEbzm+SDpHzdA8h3iPJs6rAb
 0NpGhy3XKY7HOSNIeHvIbDHTUZrewD2A6ARw1VYg1vhJbqUE4qKoUL1wLmxHrk+zHUEyLHUq
 aDpDMZArdNKpT6Nh9ySUFzlWkHUsj7uUNxU3A6GTum2aU3Gh0CD1p8+FYlG1dGhO5boTIUsR
 6ho73ZNk1bwUj/wOcqWu+ZdnQa3zbfvMI9o/kFlOu8iTGlD8sNjJK+Y/fPK3znFqoqqKmSFZ
 aiRALjAZH6ufspvYAJEJE9eZSX7Rtdyt30MMHQARAQABwsFfBBgBCgAJBQJWLOm1AhsMAAoJ
 EKTPgB1/p52GPpoP/2LOn/5KSkGHGmdjzRoQHBTdm2YV1YwgADg52/mU68Wo6viStZqcVEnX
 3ALsWeETod3qeBCJ/TR2C6hnsqsALkXMFFJTX8aRi/E4WgBqNvNgAkWGsg5XKB3JUoJmQLqe
 CGVCT1OSQA/gTEfB8tTZAGFwlw1D3W988CiGnnRb2EEqU4pEuBoQir0sixJzFWybf0jjEi7P
 pODxw/NCyIf9GNRNYByUTVKnC7C51a3b1gNs10aTUmRfQuu+iM5yST5qMp4ls/yYl5ybr7N1
 zSq9iuL13I35csBOn13U5NE67zEb/pCFspZ6ByU4zxChSOTdIJSm4/DEKlqQZhh3FnVHh2Ld
 eG/Wbc1KVLZYX1NNbXTz7gBlVYe8aGpPNffsEsfNCGsFDGth0tC32zLT+5/r43awmxSJfx2P
 5aGkpdszvvyZ4hvcDfZ7U5CBItP/tWXYV0DDl8rCFmhZZw570vlx8AnTiC1v1FzrNfvtuxm3
 92Qh98hAj3cMFKtEVbLKJvrc2AO+mQlS7zl1qWblEhpZnXi05S1AoT0gDW2lwe54VfT3ySon
 8Klpbp5W4eEoY21tLwuNzgUMxmycfM4GaJWNCncKuMT4qGVQO9SPFs0vgUrdBUC5Pn5ZJ46X
 mZA0DUz0S8BJtYGI0DUC/jAKhIgy1vAx39y7sAshwu2VILa71tXJ
In-Reply-To: <Ztd9iJI4ubmpc0_T@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/4 5:20, Jaegeuk Kim wrote: > On 09/03,
 Chao Yu wrote:
 >> On 2024/9/2 21:01, Julian Sun wrote: >>> On Mon, 2024-09-02 at 16:13 +0800, 
 Chao Yu wrote: >>>>> On 2024/8/29 0:54, Julian Sun wrote: [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slrax-0008TK-8Y
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Do not check the FI_DIRTY_INODE
 flag when umounting a ro fs.
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Julian Sun <sunjunchao2870@gmail.com>,
 syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzQgNToyMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gT24gMDkvMDMsIENoYW8gWXUg
d3JvdGU6Cj4+IE9uIDIwMjQvOS8yIDIxOjAxLCBKdWxpYW4gU3VuIHdyb3RlOgo+Pj4gT24gTW9u
LCAyMDI0LTA5LTAyIGF0IDE2OjEzICswODAwLCBDaGFvIFl1IHdyb3RlOgo+Pj4+PiBPbiAyMDI0
LzgvMjkgMDo1NCwgSnVsaWFuIFN1biB3cm90ZToKPj4+Pj4+PiBIaSwgYWxsLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gUmVjZW50bHkgc3l6Ym90IHJlcG9ydGVkIGEgYnVnIGFzIGZvbGxvd2luZzoKPj4+Pj4+
Pgo+Pj4+Pj4+IGtlcm5lbCBCVUcgYXQgZnMvZjJmcy9pbm9kZS5jOjg5NiEKPj4+Pj4+PiBDUFU6
IDEgVUlEOiAwIFBJRDogNTIxNyBDb21tOiBzeXotZXhlY3V0b3I2MDUgTm90IHRhaW50ZWQKPj4+
Pj4+PiA2LjExLjAtcmM0LXN5emthbGxlci0wMDAzMy1nODcyY2YyOGI4ZGY5ICMwCj4+Pj4+Pj4g
UklQOiAwMDEwOmYyZnNfZXZpY3RfaW5vZGUrMHgxNTk4LzB4MTVjMCBmcy9mMmZzL2lub2RlLmM6
ODk2Cj4+Pj4+Pj4gQ2FsbCBUcmFjZToKPj4+Pj4+PiAgIMKgIDxUQVNLPgo+Pj4+Pj4+ICAgwqAg
ZXZpY3QrMHg1MzIvMHg5NTAgZnMvaW5vZGUuYzo3MDQKPj4+Pj4+PiAgIMKgIGRpc3Bvc2VfbGlz
dCBmcy9pbm9kZS5jOjc0NyBbaW5saW5lXQo+Pj4+Pj4+ICAgwqAgZXZpY3RfaW5vZGVzKzB4NWY5
LzB4NjkwIGZzL2lub2RlLmM6Nzk3Cj4+Pj4+Pj4gICDCoCBnZW5lcmljX3NodXRkb3duX3N1cGVy
KzB4OWQvMHgyZDAgZnMvc3VwZXIuYzo2MjcKPj4+Pj4+PiAgIMKgIGtpbGxfYmxvY2tfc3VwZXIr
MHg0NC8weDkwIGZzL3N1cGVyLmM6MTY5Ngo+Pj4+Pj4+ICAgwqAga2lsbF9mMmZzX3N1cGVyKzB4
MzQ0LzB4NjkwIGZzL2YyZnMvc3VwZXIuYzo0ODk4Cj4+Pj4+Pj4gICDCoCBkZWFjdGl2YXRlX2xv
Y2tlZF9zdXBlcisweGM0LzB4MTMwIGZzL3N1cGVyLmM6NDczCj4+Pj4+Pj4gICDCoCBjbGVhbnVw
X21udCsweDQxZi8weDRiMCBmcy9uYW1lc3BhY2UuYzoxMzczCj4+Pj4+Pj4gICDCoCB0YXNrX3dv
cmtfcnVuKzB4MjRmLzB4MzEwIGtlcm5lbC90YXNrX3dvcmsuYzoyMjgKPj4+Pj4+PiAgIMKgIHB0
cmFjZV9ub3RpZnkrMHgyZDIvMHgzODAga2VybmVsL3NpZ25hbC5jOjI0MDIKPj4+Pj4+PiAgIMKg
IHB0cmFjZV9yZXBvcnRfc3lzY2FsbCBpbmNsdWRlL2xpbnV4L3B0cmFjZS5oOjQxNSBbaW5saW5l
XQo+Pj4+Pj4+ICAgwqAgcHRyYWNlX3JlcG9ydF9zeXNjYWxsX2V4aXQgaW5jbHVkZS9saW51eC9w
dHJhY2UuaDo0NzcKPj4+Pj4+PiBbaW5saW5lXQo+Pj4+Pj4+ICAgwqAgc3lzY2FsbF9leGl0X3dv
cmsrMHhjNi8weDE5MCBrZXJuZWwvZW50cnkvY29tbW9uLmM6MTczCj4+Pj4+Pj4gICDCoCBzeXNj
YWxsX2V4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUga2VybmVsL2VudHJ5L2NvbW1vbi5jOjIwMAo+
Pj4+Pj4+IFtpbmxpbmVdCj4+Pj4+Pj4gICDCoCBfX3N5c2NhbGxfZXhpdF90b191c2VyX21vZGVf
d29yayBrZXJuZWwvZW50cnkvY29tbW9uLmM6MjA1Cj4+Pj4+Pj4gW2lubGluZV0KPj4+Pj4+PiAg
IMKgIHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHgyNzkvMHgzNzAKPj4+Pj4+PiBrZXJuZWwv
ZW50cnkvY29tbW9uLmM6MjE4Cj4+Pj4+Pj4gICDCoCBkb19zeXNjYWxsXzY0KzB4MTAwLzB4MjMw
IGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjg5Cj4+Pj4+Pj4gICDCoCBlbnRyeV9TWVNDQUxMXzY0
X2FmdGVyX2h3ZnJhbWUrMHg3Ny8weDdmCj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgc3l6Ym90IGNvbnN0
cnVjdGVkIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW86IGNvbmN1cnJlbnRseQo+Pj4+Pj4+IGNyZWF0
aW5nIGRpcmVjdG9yaWVzIGFuZCBzZXR0aW5nIHRoZSBmaWxlIHN5c3RlbSB0byByZWFkLW9ubHku
Cj4+Pj4+Pj4gSW4gdGhpcyBjYXNlLCB3aGlsZSBmMmZzIHdhcyBtYWtpbmcgZGlyLCB0aGUgZmls
ZXN5c3RlbQo+Pj4+Pj4+IHN3aXRjaGVkIHRvCj4+Pj4+Pj4gcmVhZG9ubHksIGFuZCB3aGVuIGl0
IHRyaWVkIHRvIGNsZWFyIHRoZSBkaXJ0eSBmbGFnLCBpdAo+Pj4+Pj4+IHRyaWdnZXJlZAo+Pgo+
PiBHbyBiYWNrIHRvIHRoZSByb290IGNhdXNlLCBJIGhhdmUgbm8gaWRlYSB3aHkgaXQgY2FuIGxl
YXZlIGRpcnR5IGlub2RlCj4+IHdoaWxlIG1rZGlyIHJhY2VzIHcvIHJlYWRvbmx5IHJlbW91bnQs
IGR1ZSB0byB0aGUgdHdvIG9wZXJhdGlvbnMgc2hvdWxkCj4+IGJlIGV4Y2x1c2l2ZSwgSUlVQy4K
PiAKPiBXYWl0LCB3ZSBjYW4gdGhpbmsgb2Ygd3JpdGFibGUgZGlzayBtb3VudGVkIGFzIGZzLXJl
YWRvbmx5LiBJbiB0aGF0IGNhc2UsCj4gSUlSQywgd2UgYWxsb3cgdG8gcmVjb3ZlciBmaWxlcy9k
YXRhIGJ5IHJvbGwtZm9yd2FyZCBhbmQgc28gb24sIHdoaWNoIGNhbgoKV2Ugd2lsbCByZW1vdmUg
U0JfUkRPTkxZIGZsYWcgZnJvbSBzYi0+c19mbGFncyBpbnRlbnRpb25hbGx5IGJlZm9yZQpyZWNv
dmVyeSwgc28gdGhhdCBmb2xsb3dpbmcgd3JpdGVfY2hlY2twb2ludCgpIG9yIHN5bmNfZmlsZXN5
c3RlbSgpCndvbid0IHNraXAgZmx1c2hpbmcgZHVlIHRvIHNiIGlzIHJlYWRvbmx5LgoKc3RhdGlj
IGJvb2wgZjJmc19yZWNvdmVyX3F1b3RhX2JlZ2luKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkK
ewouLi4KCWlmIChyZWFkb25seSkgewoJCXNiaS0+c2ItPnNfZmxhZ3MgJj0gflNCX1JET05MWTsK
CQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfSVNfV1JJVEFCTEUpOwoJfQouLi4KfQoKPiBtYWtlIHNv
bWUgZGlydHkgaW5vZGVzLiBDYW4gd2UgY2hlY2sgaWYgdGhlcmUncyBhbnkgbWlzc2luZyBwYXRo
IHdoaWNoIGRvZXMKPiBub3QgZmx1c2ggZGlydHkgaW5vZGU/CgpJIGd1ZXNzIHRoZSByb290IGNh
dXNlIG9mIHRoaXMgaXNzdWUgaXMgbGlrZSB0aGlzOgoKLSBmMmZzX2xvb2t1cAogIC0gX19yZWNv
dmVyX2RvdF9kZW50cmllcygpCiAgIC0gY2xlYXJfaW5vZGVfZmxhZyhkaXIsIEZJX0lOTElORV9E
T1RTKQogICAgLSBfX21hcmtfaW5vZGVfZGlydHlfZmxhZygpCgkJCQkJLSByZW1vdW50IHJkb25s
eQoJCQkJCSAtIHNiLT5zX2ZsYWdzIHw9IFNCX1JET05MWQoKLSB1bW91bnQKICAtIGtpbGxfZjJm
c19zdXBlcgogICAtIGtpbGxfYmxvY2tfc3VwZXIKICAgIC0gZ2VuZXJpY19zaHV0ZG93bl9zdXBl
cgogICAgIC0gc3luY19maWxlc3lzdGVtIHNraXBzIGR1ZSB0byBzYl9yZG9ubHkgaXMgdHJ1ZQog
ICAgIC0gZXZpY3RfaW5vZGVzCiAgICAgIC0gZGlzcG9zZV9saXN0CiAgICAgICAtIGYyZnNfZXZp
Y3RfaW5vZGUgcGFuaWMKClNvIGhvdyBhYm91dCB0aGlzPwoKaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2hhby9saW51eC5naXQvY29tbWl0Lz9oPXdpcCZp
ZD1lMDgwZmM4YmVjNGQ2NzRjYjhlYjI2ZWYwYTA0MzJmODhiZDY1ZGQwCgpUaGFua3MsCgo+IAo+
Pgo+PiAtIG1rZGlyCj4+ICAgLSBkb19ta2RpcmF0Cj4+ICAgIC0gZmlsZW5hbWVfY3JlYXRlCj4+
ICAgICAtIG1udF93YW50X3dyaXRlCj4+ICAgICAgLSBtbnRfZ2V0X3dyaXRlX2FjY2Vzcwo+PiAJ
CQkJLSBtb3VudAo+PiAJCQkJIC0gZG9fcmVtb3VudAo+PiAJCQkJICAtIHJlY29uZmlndXJlX3N1
cGVyCj4+IAkJCQkgICAtIHNiX3ByZXBhcmVfcmVtb3VudF9yZWFkb25seQo+PiAJCQkJICAgIC0g
bW50X2hvbGRfd3JpdGVycwo+PiAgICAtIHZmc19ta2Rpcgo+PiAgICAgLSBmMmZzX21rZGlyCj4+
Cj4+IEJ1dCB3aGVuIEkgdHJ5IHRvIHJlcHJvZHVjZSB0aGlzIGJ1ZyB3LyByZXByb2R1Y2VyIHBy
b3ZpZGVkIGJ5IHN5emJvdCwKPj4gSSBoYXZlIGZvdW5kIGEgY2x1ZSBpbiB0aGUgbG9nOgo+Pgo+
PiAic2tpcCByZWNvdmVyaW5nIGlubGluZV9kb3RzIGlub2RlLi4uIgo+Pgo+PiBTbyBJIGRvdWJ0
IHRoZSByb290IGNhdXNlIGlzIF9fcmVjb3Zlcl9kb3RfZGVudHJpZXMoKSBpbiBmMmZzX2xvb2t1
cCgpCj4+IGdlbmVyYXRlcyBkaXJ0eSBkYXRhL21ldGEsIGluIHRoaXMgcGF0aCwgd2Ugd2lsbCBu
b3QgZ3JhYiByZWxhdGVkIGxvY2sKPj4gdG8gZXhjbHVkZSByZWFkb25seSByZW1vdW50Lgo+Pgo+
PiBMZXQgbWUgdHJ5IHRvIHZlcmlmeSBiZWxvdyBwYXRjaDoKPj4KPj4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2hhby9saW51eC5naXQvY29tbWl0Lz9o
PXdpcCZpZD02OWRjOGZiYmJiMzlmODVmOWY0MzZjYTU2MmM5OGFmYmNjMmE0OGQyCj4+Cj4+IFRo
YW5rcywKPj4KPj4+Pj4+PiB0aGlzCj4+Pj4+Pj4gY29kZSBwYXRoOiBmMmZzX21rZGlyKCktPiBm
MmZzX3N5bmNfZnMoKS0KPj4+Pj4+Pj4gZjJmc193cml0ZV9jaGVja3BvaW50KCkKPj4+Pj4+PiAt
PmYyZnNfcmVhZG9ubHkoKS4gVGhpcyByZXN1bHRlZCBGSV9ESVJUWV9JTk9ERSBmbGFnIG5vdCBi
ZWluZwo+Pj4+Pj4+IGNsZWFyZWQsCj4+Pj4+Pj4gd2hpY2ggZXZlbnR1YWxseSBsZWQgdG8gYSBi
dWcgYmVpbmcgdHJpZ2dlcmVkIGR1cmluZyB0aGUKPj4+Pj4+PiBGSV9ESVJUWV9JTk9ERQo+Pj4+
Pj4+IGNoZWNrIGluIGYyZnNfZXZpY3RfaW5vZGUoKS4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIHRoaXMg
Y2FzZSwgd2UgY2Fubm90IGRvIGFueXRoaW5nIGZ1cnRoZXIsIHNvIGlmIGZpbGVzeXN0ZW0KPj4+
Pj4+PiBpcwo+Pj4+Pj4+IHJlYWRvbmx5LAo+Pj4+Pj4+IGRvIG5vdCB0cmlnZ2VyIHRoZSBCVUcu
IEluc3RlYWQsIGNsZWFuIHVwIHJlc291cmNlcyB0byB0aGUgYmVzdAo+Pj4+Pj4+IG9mCj4+Pj4+
Pj4gb3VyCj4+Pj4+Pj4gYWJpbGl0eSB0byBwcmV2ZW50IHRyaWdnZXJpbmcgc3Vic2VxdWVudCBy
ZXNvdXJjZSBsZWFrIGNoZWNrcy4KPj4+Pj4+Pgo+Pj4+Pj4+IElmIHRoZXJlIGlzIGFueXRoaW5n
IGltcG9ydGFudCBJJ20gbWlzc2luZywgcGxlYXNlIGxldCBtZSBrbm93LAo+Pj4+Pj4+IHRoYW5r
cy4KPj4+Pj4+Pgo+Pj4+Pj4+IFJlcG9ydGVkLWJ5Ogo+Pj4+Pj4+IHN5emJvdCtlYmVhMjc5MDkw
NDY3M2Q3YzYxOEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+Pj4+Pj4gQ2xvc2VzOgo+Pj4+
Pj4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1lYmVhMjc5MDkwNDY3
M2Q3YzYxOAo+Pj4+Pj4+IEZpeGVzOiBjYTdkODAyYTdkOGUgKCJmMmZzOiBkZXRlY3QgZGlydHkg
aW5vZGUgaW4gZXZpY3RfaW5vZGUiKQo+Pj4+Pj4+IENDOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWFuIFN1biA8c3VuanVuY2hhbzI4NzBAZ21haWwu
Y29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICAgwqAgZnMvZjJmcy9pbm9kZS5jIHwgMyArKy0KPj4+
Pj4+PiAgIMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lu
b2RlLmMKPj4+Pj4+PiBpbmRleCBhZWY1NzE3MjAxNGYuLmViZjgyNWRiYTBhNSAxMDA2NDQKPj4+
Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+PiArKysgYi9mcy9mMmZzL2lub2RlLmMK
Pj4+Pj4+PiBAQCAtODkyLDcgKzg5Miw4IEBAIHZvaWQgZjJmc19ldmljdF9pbm9kZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlKQo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYXRvbWljX3JlYWQoJmZpLT5pX2NvbXByX2Jsb2NrcykpOwo+Pj4+Pj4+
ICAgwqDCoMKgwqDCoMKgwqDCoGlmIChsaWtlbHkoIWYyZnNfY3BfZXJyb3Ioc2JpKSAmJgo+Pj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCFpc19zYmlfZmxhZ19zZXQoc2JpLAo+Pj4+Pj4+IFNCSV9DUF9ESVNBQkxFRCkp
KQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCFpc19zYmlfZmxhZ19zZXQoc2JpLAo+Pj4+Pj4+IFNCSV9DUF9ESVNB
QkxFRCkpICYmCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIWYyZnNfcmVhZG9ubHkoc2JpLT5zYikpCj4+Pj4+Cj4+
Pj4+IElzIGl0IGZpbmUgdG8gZHJvcCB0aGlzIGRpcnR5IGlub2RlPyBTaW5jZSBvbmNlIGl0IHJl
bW91bnRzIGYyZnMgYXMKPj4+Pj4gcncgb25lLAo+Pj4+PiBwcmV2aW91cyB1cGRhdGVzIG9uIHN1
Y2ggaW5vZGUgbWF5IGJlIGxvc3Q/IE9yIGFtIEkgbWlzc2luZwo+Pj4+PiBzb21ldGhpbmc/Cj4+
Pgo+Pj4gVGhlIHB1cnBvc2Ugb2YgY2FsbGluZyB0aGlzIGhlcmUgaXMgbWFpbmx5IHRvIGF2b2lk
IHRyaWdnZXJpbmcgdGhlCj4+PiBmMmZzX2J1Z19vbihzYmksIDEpOyBzdGF0ZW1lbnQgaW4gdGhl
IHN1YnNlcXVlbnQgZjJmc19wdXRfc3VwZXIoKSBkdWUKPj4+IHRvIGEgcmVmZXJlbmNlIGNvdW50
IGNoZWNrIGZhaWx1cmUuCj4+PiBJIHdvdWxkIHNheSBpdCdzIHBvc3NpYmxlLCBidXQgdGhlcmUg
ZG9lc24ndCBzZWVtIHRvIGJlIG11Y2ggbW9yZSB3ZQo+Pj4gY2FuIGRvIGluIHRoaXMgc2NlbmFy
aW86IHRoZSBpbm9kZSBpcyBhYm91dCB0byBiZSBmcmVlZCwgYW5kIHRoZSBmaWxlCj4+PiBzeXN0
ZW0gaXMgcmVhZC1vbmx5LiBPciBkbyB3ZSBuZWVkIGEgbWVjaGFuaXNtIHRvIHNhdmUgdGhlIGlu
b2RlIHRoYXQKPj4+IGlzIGFib3V0IHRvIGJlIGZyZWVkIGFuZCB0aGVuIHdyaXRlIGl0IGJhY2sg
dG8gZGlzayBhdCB0aGUgYXBwcm9wcmlhdGUKPj4+IHRpbWUgYWZ0ZXIgdGhlIGZpbGUgc3lzdGVt
IGJlY29tZXMgcncgYWdhaW4/IEJ1dCBzdWNoIGEgbWVjaGFuaXNtCj4+PiBzb3VuZHMgc29tZXdo
YXQgY29tcGxleCBhbmQgYSBsaXR0bGUgYml0IG9mIHdlaXJkLi4uIERvIHlvdSBoYXZlIGFueQo+
Pj4gc3VnZ2VzdGlvbnM/Cj4+Cj4+Cj4+Cj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4KPj4+
Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZjJmc19idWdfb24oc2JpLCBp
c19pbm9kZV9mbGFnX3NldChpbm9kZSwKPj4+Pj4+PiBGSV9ESVJUWV9JTk9ERSkpOwo+Pj4+Pj4+
ICAgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZjJmc19pbm9kZV9zeW5jZWQoaW5vZGUpOwo+Pj4+Pgo+Pj4KPj4+Cj4+PiBUaGFu
a3MsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
