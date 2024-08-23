Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF195C323
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 04:14:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shJog-00055q-DB;
	Fri, 23 Aug 2024 02:14:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1shJod-00055h-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 02:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aXrScm3PulmHUJmCd/1Rzxhhm/hbcv77BnAf8YXDiGk=; b=ZIGvzkTk5uaFztnfKWIxwSWNy1
 j9SRsszzLtuBCsQYH6FWljxFHrzF7fM+WtksMxld6xUeSGadN/uhcYu2gk3C9r9jjT/1Vf/lXaZ/T
 H/erPWIa3eqjTeqxvJFKI/ohTFsQ7DPo0QP1pb1FzdKf7SpBfaiGML08IE6dne+8aEqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aXrScm3PulmHUJmCd/1Rzxhhm/hbcv77BnAf8YXDiGk=; b=kyxdehRgPpOPjnjz9yP+r+LTeR
 W/snIH9cmcb+HbSj9q2T0v0fQh9y1Mv1PhFr86s5iJ3yRvdKvRsQcGGhki8nkBNbfyDua2US/ctB1
 IxbWFATYeJMCPaleqh2PFmbCSDlgSuv/md0Bi8o+AxN+aQIjJGpBJj2EYR9IGA/1+wPg=;
Received: from mout.gmx.net ([212.227.17.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1shJod-0006i3-Hj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 02:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1724379227; x=1724984027; i=quwenruo.btrfs@gmx.com;
 bh=aXrScm3PulmHUJmCd/1Rzxhhm/hbcv77BnAf8YXDiGk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tBpVTJPUqx0mw75Ux8Eg/aqpfKFHe8BXr9vGTMIByIco0wHodPaC5jr6ZsJ6QuHm
 jv4VFflZ/yvauqkpXEqMLNRkMEZK43+sCTwdMKmD3iFMnZhHgl7KnfdAcQI6NTF4a
 siRPh4dL4NP9oCZfnsj8C/YmNkjX03bTVefh192uOK1olmfZsQfNUiJwmoCGpzLNl
 nPtrA/9ieJjSSqaNgcpU+sWiur44HJDNmKMuyD0AeVqcv6sgTqpvGDKmjxrVOF7eo
 hevGbJxrjScVMO5vX6B7+2ej6/rTITfxweZcpjcj1lqw9P1Y6qE9s1V4vBZQfkHTb
 Th7GGgo/jcCI5xRoqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MxlzC-1rvGOC46KE-00xM5F; Fri, 23
 Aug 2024 04:13:47 +0200
Message-ID: <7a04ac3b-e655-4a80-89dc-19962db50f05@gmx.com>
Date: Fri, 23 Aug 2024 11:43:41 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
 <38247c40-604b-443a-a600-0876b596a284@gmx.com>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00iVQUJDToH
 pgAKCRDCPZHzoSX+qNKACACkjDLzCvcFuDlgqCiS4ajHAo6twGra3uGgY2klo3S4JespWifr
 BLPPak74oOShqNZ8yWzB1Bkz1u93Ifx3c3H0r2vLWrImoP5eQdymVqMWmDAq+sV1Koyt8gXQ
 XPD2jQCrfR9nUuV1F3Z4Lgo+6I5LjuXBVEayFdz/VYK63+YLEAlSowCF72Lkz06TmaI0XMyj
 jgRNGM2MRgfxbprCcsgUypaDfmhY2nrhIzPUICURfp9t/65+/PLlV4nYs+DtSwPyNjkPX72+
 LdyIdY+BqS8cZbPG5spCyJIlZonADojLDYQq4QnufARU51zyVjzTXMg5gAttDZwTH+8LbNI4
 mm2YzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00ibgUJDToHvwAK
 CRDCPZHzoSX+qK6vB/9yyZlsS+ijtsvwYDjGA2WhVhN07Xa5SBBvGCAycyGGzSMkOJcOtUUf
 tD+ADyrLbLuVSfRN1ke738UojphwkSFj4t9scG5A+U8GgOZtrlYOsY2+cG3R5vjoXUgXMP37
 INfWh0KbJodf0G48xouesn08cbfUdlphSMXujCA8y5TcNyRuNv2q5Nizl8sKhUZzh4BascoK
 DChBuznBsucCTAGrwPgG4/ul6HnWE8DipMKvkV9ob1xJS2W4WJRPp6QdVrBWJ9cCdtpR6GbL
 iQi22uZXoSPv/0oUrGU+U5X4IvdnvT+8viPzszL5wXswJZfqfy8tmHM85yjObVdIG6AlnrrD
In-Reply-To: <38247c40-604b-443a-a600-0876b596a284@gmx.com>
X-Provags-ID: V03:K1:Dvs7VzrjjFpp1r9ZI7YTkeiaqLMrnufdKl4GmRyuV81uEUpg2wR
 UYH3V8I+oLGRz56PAYi+AD9lW4h56rk+tD0Yy60vL21bhYsL1rjV8V8Y6NQq0j9r9urCIve
 9a8CHXR6v7LdOL5Vpj0HAiybaX758eCxxWPASKXkXhsEiOr+W9ZxLZX5zGFdME7joJVzJ3D
 AYlVW6mAsaIYCwdFuksnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KWAnWs1w4AI=;FIDgK7OOtFR8xkoc9zyy0TDH69H
 0T2FOALWLke2bZxHZv0umErh1y+/bO4LMARgoUciODzxIbNgO6cWEFU8uNo9t1Sx92Qx4hDUo
 uRg938njahko1ByVwhM0HdY14nerzenEXTHR5sw4EraAKj4HWyiXb1fP7Zw2z6LxdgudsQj4a
 3pKbkwvUh5ajI2D7o5wKpIiG71qPGQ4SZZAHz0wZpevQklMHjCy17+QGFQdgEyjcogqG2e8hV
 gxSmVeKuc/TbOdsEPD4BKqhgZOTbQAWfmKOPohX4+XEnpHTaJlmkrzQq2Thqh9meJIl7XrWbZ
 g1cUzbotELMLOy4UizNOXcVDFPto7B6rjPXLP8/kDU6l+wacVlMlDFQ5FrYcwlJkA99uaA/3S
 sjd8z/wjgVk5UgwP0vIuFgq6cQSAlyxfibhVTlnNMl/IE2Nf7/LgYLLlM6NDx+hRze9ajrUZu
 BIa0fzYxtKaE8Uftz2y/KKlIV85G5QPM5tY8k8S2n9IwptANw/DFmXPPAwdJ95JsvMGcYESt2
 bLjwr8dbNU0dSKuQAK1n5XmC42XCmHpQYQD0i42BrjwA2iqwgza18H7eiK7kRqDdZipS4F2E+
 2dcZjXu5WezfkMh57r8acvHSKJJKUOu4Ij+vUKlzQFp1oPdBUrF/m16NdYKeAiKNo2wxgl8Gd
 iYn2ElZjV0kxiuHt7okG3S0c8j9QjYFs7BzZVc9F+LnJyDtj9I0er/vrU6+HyRbhnZpP74ZzR
 0sq0EyVRnKc+az4jheYViSuNDJ6A1RtQ2z1SJBexvo9GyVkDOOMnq145LAmmkVcBf5ihthF8V
 +HyR2o5W9Jdmwuz+oKDdQ3UQ==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/8/23 07:55, Qu Wenruo 写道: > > > 在 2024/8/22
    21:37, Matthew Wilcox 写道: >> On Thu, Aug 22, 2024 at 08:28:09PM +0930,
    Qu Wenruo wrote: >>> 在 2024/8/22 12:35, Matthew Wilcox 写道: > [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: gmx.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.20 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.20 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [quwenruo.btrfs[at]gmx.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.20 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1shJod-0006i3-Hj
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNC84LzIzIDA3OjU1LCBRdSBXZW5ydW8g5YaZ6YGTOgo+Cj4KPiDlnKggMjAyNC84
LzIyIDIxOjM3LCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4+IE9uIFRodSwgQXVnIDIyLCAyMDI0
IGF0IDA4OjI4OjA5UE0gKzA5MzAsIFF1IFdlbnJ1byB3cm90ZToKPj4+IOWcqCAyMDI0LzgvMjIg
MTI6MzUsIE1hdHRoZXcgV2lsY294IOWGmemBkzoKPj4+Pj4gLcKgwqDCoCB3aGlsZSAoY3VyIDwg
cGFnZV9zdGFydCArIFBBR0VfU0laRSkgewo+Pj4+PiArwqDCoMKgIHdoaWxlIChjdXIgPCBmb2xp
b19zdGFydCArIFBBR0VfU0laRSkgewo+Pj4+Cj4+Pj4gUHJlc3VtYWJseSB3ZSB3YW50IHRvIHN1
cHBvcnQgbGFyZ2UgZm9saW9zIGluIGJ0cmZzIGF0IHNvbWUgcG9pbnQ/Cj4+Pgo+Pj4gWWVzLCBh
bmQgd2UncmUgYWxyZWFkeSB3b3JraW5nIHRvd2FyZHMgdGhhdCBkaXJlY3Rpb24uCj4+Pgo+Pj4+
IEkgY2VydGFpbmx5IHdhbnQgdG8gcmVtb3ZlIENPTkZJR19SRUFEX09OTFlfVEhQX0ZPUl9GUyBz
b29uIGFuZCB0aGF0J2xsCj4+Pj4gYmUgYSBiaXQgb2YgYSByZWdyZXNzaW9uIGZvciBidHJmcyBp
ZiBpdCBkb2Vzbid0IGhhdmUgbGFyZ2UgZm9saW8KPj4+PiBzdXBwb3J0LsKgIFNvIHNob3VsZG4n
dCB3ZSBhbHNvIHMvUEFHRV9TSVpFL2ZvbGlvX3NpemUoZm9saW8pLyA/Cj4+Pgo+Pj4gQUZBSUsg
d2UncmUgb25seSBnb2luZyB0byBzdXBwb3J0IGxhcmdlciBmb2xpb3MgdG8gc3VwcG9ydCBsYXJn
ZXIgdGhhbgo+Pj4gUEFHRV9TSVpFIHNlY3RvciBzaXplIHNvIGZhci4KPj4KPj4gV2h5IGRvIHlv
dSBub3Qgd2FudCB0aGUgcGVyZm9ybWFuY2UgZ2FpbnMgZnJvbSB1c2luZyBsYXJnZXIgZm9saW9z
Pwo+Pgo+Pj4gU28gZXZlcnkgZm9saW8gaXMgc3RpbGwgaW4gYSBmaXhlZCBzaXplIChzZWN0b3Ig
c2l6ZSwgPj0gUEFHRV9TSVpFKS4KPj4+Cj4+PiBOb3QgZmFtaWxpYXIgd2l0aCB0cmFuc3BhcmVu
dCBodWdlIHBhZ2UsIEkgdGhvdWdodCB0cmFuc3BhcmVudCBodWdlIHBhZ2UKPj4+IGlzIHRyYW5z
cGFyZW50IHRvIGZzLgo+Pj4KPj4+IE9yIGRvIHdlIG5lZWQgc29tZSBzcGVjaWFsIGhhbmRsaW5n
Pwo+Pj4gTXkgdW5lZHVjYXRlZCBndWVzcyBpcywgd2Ugd2lsbCBnZXQgYSBsYXJnZXIgZm9saW8g
cGFzc2VkIHRvIHJlYWRwYWdlCj4+PiBjYWxsIGJhY2sgZGlyZWN0bHk/Cj4+Cj4+IFdoeSBkbyB5
b3UgY2hvb3NlIHRvIHJlbWFpbiB1bmVkdWNhdGVkP8KgIEl0J3Mgbm90IGxpa2UgSSd2ZSBiZWVu
IGtlZXBpbmcKPj4gYWxsIG9mIHRoaXMgdG8gbXlzZWxmIGZvciB0aGUgcGFzdCBmaXZlIHllYXJz
LsKgIEkndmUgZ2l2ZW4gZG96ZW5zIG9mCj4+IHByZXNlbnRhdGlvbnMgb24gaXQsIGluY2x1ZGlu
ZyBwbGVuYXJ5IHNlc3Npb25zIGF0IExTRk1NLsKgIEFzIGEKPj4gZmlsZXN5c3RlbQo+PiBkZXZl
bG9wZXIsIHlvdSBtdXN0IHdhbnQgdG8gbm90IGtub3cgYWJvdXQgaXQgYXQgdGhpcyBwb2ludC4K
Pj4KPj4+IEl0J3Mgc3RyYWlnaHRmb3J3YXJkIGVub3VnaCB0byByZWFkIGFsbCBjb250ZW50cyBm
b3IgYSBsYXJnZXIgZm9saW8sCj4+PiBpdCdzIG5vIGRpZmZlcmVudCB0byBzdWJwYWdlIGhhbmRs
aW5nLgo+Pj4KPj4+IEJ1dCB3aGF0IHdpbGwgaGFwcGVuIGlmIHNvbWUgd3JpdGVzIGhhcHBlbmVk
IHRvIHRoYXQgbGFyZ2VyIGZvbGlvPwo+Pj4gRG8gTU0gbGF5ZXIgZGV0ZWN0cyB0aGF0IGFuZCBz
cGxpdCB0aGUgZm9saW9zPyBPciB0aGUgZnMgaGFzIHRvIGdvIHRoZQo+Pj4gc3VicGFnZSByb3V0
aW5lICh3aXRoIGFuIGV4dHJhIHN0cnVjdHVyZSByZWNvcmRpbmcgYWxsIHRoZSBzdWJwYWdlIGZs
YWdzCj4+PiBiaXRtYXApPwo+Pgo+PiBFbnRpcmVseSB1cCB0byB0aGUgZmlsZXN5c3RlbS7CoCBJ
dCB3b3VsZCBoZWxwIGlmIGJ0cmZzIHVzZWQgdGhlIHNhbWUKPj4gdGVybWlub2xvZ3kgYXMgdGhl
IHJlc3Qgb2YgdGhlIGZpbGVzeXN0ZW1zIGluc3RlYWQgb2YgaW52ZW50aW5nIGl0cyBvd24KPj4g
InN1YnBhZ2UiIHRoaW5nLsKgIEFzIGZhciBhcyBJIGNhbiB0ZWxsLCAic3VicGFnZSIgbWVhbnMg
ImZzIGJsb2NrIHNpemUiLAo+PiBidXQgbWF5YmUgaXQgaGFzIGEgZGlmZmVyZW50IG1lYW5pbmcg
dGhhdCBJIGhhdmVuJ3QgYXNjZXJ0YWluZWQuCj4KPiBUaGVuIHRlbGwgbWUgdGhlIGNvcnJlY3Qg
dGVybWlub2xvZ3kgdG8gZGVzY3JpYmUgZnMgYmxvY2sgc2l6ZSBzbWFsbGVyCj4gdGhhbiBwYWdl
IHNpemUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Cj4gImZzIGJsb2NrIHNpemUiIGlzIG5vdCBnb29k
IGVub3VnaCwgd2Ugd2FudCBhIHRlcm1pbm9sb2d5IHRvIGRlc2NyaWJlCj4gImZzIGJsb2NrIHNp
emUiIHNtYWxsZXIgdGhhbiBwYWdlIHNpemUuCj4KPj4KPj4gVHJhY2tpbmcgZGlydGluZXNzIG9u
IGEgcGVyLWZvbGlvIGJhc2lzIGRvZXMgbm90IHNlZW0gdG8gYmUgZ29vZCBlbm91Z2guCj4+IFZh
cmlvdXMgcGVvcGxlIGhhdmUgd29ya2xvYWRzIHRoYXQgcmVncmVzcyBpbiBwZXJmb3JtYW5jZSBp
ZiB5b3UgZG8KPj4gdGhhdC7CoCBTbyBoYXZpbmcgc29tZSBkYXRhIHN0cnVjdHVyZSBhdHRhY2hl
ZCB0byBmb2xpby0+cHJpdmF0ZSB3aGljaAo+PiB0cmFja3MgZGlydGluZXNzIG9uIGEgcGVyLWZz
LWJsb2NrIGJhc2lzIHdvcmtzIHByZXR0eSB3ZWxsLsKgIGlvbWFwIGFsc28KPj4gdHJhY2tzIHRo
ZSB1cHRvZGF0ZSBiaXQgb24gYSBwZXItZnMtYmxvY2sgYmFzaXMsIGJ1dCBJJ20gbGVzcyBjb252
aW5jZWQKPj4gdGhhdCdzIG5lY2Vzc2FyeS4KPj4KPj4gSSBoYXZlIG5vIGlkZWEgd2h5IGJ0cmZz
IHRoaW5rcyBpdCBuZWVkcyB0byB0cmFjayB3cml0ZWJhY2ssIG9yZGVyZWQsCj4+IGNoZWNrZWQg
YW5kIGxvY2tlZCBpbiBhIGJpdG1hcC7CoCBUaG9zZSBtYWtlIG5vIHNlbnNlIHRvIG1lLsKgIEJ1
dCB0aGV5Cj4+IG1ha2Ugbm8gc2Vuc2UgdG8gbWUgaWYgeW91J3JlIHN1cHBvcnQgYSA0S2lCIGZp
bGVzeXN0ZW0gb24gYSBtYWNoaW5lCj4+IHdpdGggYSA2NEtpQiBQQUdFX1NJWkUsIG5vdCBqdXN0
IGluIHRoZSBjb250ZXh0IG9mICJsYXJnZXIgZm9saW9zIi4KPj4gV3JpdGViYWNrIGlzIHNvbWV0
aGluZyB0aGUgVk0gdGVsbHMgeW91IHRvIGRvOyB3aHkgZG8geW91IG5lZWQgdG8gdGFnCj4+IGlu
ZGl2aWR1YWwgYmxvY2tzIGZvciB3cml0ZWJhY2s/Cj4KPiBCZWNhdXNlIHRoZXJlIGFyZSBjYXNl
cyB3aGVyZSBidHJmcyBuZWVkcyB0byBvbmx5IHdyaXRlIGJhY2sgcGFydCBvZiB0aGUKPiBmb2xp
byBpbmRlcGVuZGVudGx5Lgo+Cj4gQW5kIGVzcGVjaWFsbHkgZm9yIG1peGluZyBjb21wcmVzc2lv
biBhbmQgbm9uLWNvbXByZXNzaW9uIHdyaXRlcyBpbnNpZGUKPiBhIHBhZ2UsIGUuZzoKPgo+ICDC
oMKgwqDCoMKgIDDCoMKgwqDCoCAxNkvCoMKgwqDCoCAzMkvCoMKgwqDCoCA0OEvCoMKgwqDCoMKg
IDY0Swo+ICDCoMKgwqDCoMKgIHwvL3zCoMKgwqDCoMKgwqDCoMKgwqAgfC8vLy8vLy98Cj4gIMKg
wqDCoMKgwqDCoMKgwqAgNEsKPgo+IEluIGFib3ZlIGNhc2UsIGlmIHdlIG5lZWQgdG8gd3JpdGVi
YWNrIGFib3ZlIHBhZ2Ugd2l0aCA0SyBzZWN0b3Igc2l6ZSwKPiB0aGVuIHRoZSBmaXJzdCA0SyBp
cyBub3Qgc3VpdGFibGUgZm9yIGNvbXByZXNzaW9uIChyZXN1bHQgd2lsbCBzdGlsbAo+IHRha2Ug
YSBmdWxsIDRLIGJsb2NrKSwgd2hpbGUgdGhlIHJhbmdlIFszMkssIDQ4Sykgd2lsbCBiZSBjb21w
cmVzc2VkLgo+Cj4gSW4gdGhhdCBjYXNlLCBbMCwgNEspIHJhbmdlIHdpbGwgYmUgc3VibWl0dGVk
IGRpcmVjdGx5IGZvciBJTy4KPiBNZWFud2hpbGUgWzMySywgNDgpIHdpbGwgYmUgc3VibWl0dGVk
IGZvciBjb21wcmVzc2lvbiBpbiBhbnRvaGVyIHdxLgo+IChPciB0aW1lIGNvbnN1bWluZyBjb21w
cmVzc2lvbiB3aWxsIGRlbGF5IHRoZSB3cml0ZWJhY2sgb2YgdGhlIHJlbWFpbmluZwo+IHBhZ2Vz
KQo+Cj4gVGhpcyBtZWFucyB0aGUgZGlydHkvd3JpdGViYWNrIGZsYWdzIHdpbGwgaGF2ZSBhIGRp
ZmZlcmVudCB0aW1pbmcgdG8gYmUKPiBjaGFuZ2VkLgoKSnVzdCBpbiBjYXNlIGlmIHlvdSBtZWFu
IHVzaW5nIGFuIGF0b21pYyB0byB0cmFjZSB0aGUgd3JpdGViYWNrL2xvY2sKcHJvZ3Jlc3MsIHRo
ZW4gaXQncyBwb3NzaWJsZSB0byBnbyB0aGF0IHBhdGgsIGJ1dCBmb3Igbm93IGl0J3Mgbm90IHNw
YWNlCmVmZmljaWVudC4KCkZvciAxNiBibG9ja3MgcGVyIHBhZ2UgY2FzZSAoNEsgc2VjdG9yc2l6
ZSA2NEsgcGFnZSBzaXplKSwgZWFjaCBhdG9taWMKdGFrZXMgNCBieXRlcyB3aGlsZSBhIGJpdG1h
cCBvbmx5IHRha2VzIDIgYnl0ZXMuCgpBbmQgZm9yIDRLIHNlY3RvcnNpemUgMTZLIHBhZ2Ugc2l6
ZSBjYXNlLCBpdCdzIHdvcnNlIGFuZCBidHJmcyBjb21wYWN0CmFsbCB0aGUgYml0bWFwcyBpbnRv
IGEgbGFyZ2VyIG9uZSB0byBzYXZlIG1vcmUgc3BhY2UsIHdoaWxlIGVhY2ggYXRvbWljCnN0aWxs
IHRha2VzIDQgYnl0ZXMuCgpUaGFua3MsClF1Cgo+Cj4gSSB0aGluayBjb21wcmVzc2lvbiBpcyBu
byBsb25nIGEgYnRyZnMgZXhjbHVzaXZlIGZlYXR1cmUsIHRodXMgdGhpcwo+IHNob3VsZCBiZSBv
YnZpb3VzPwo+Cj4gVGhhbmtzLAo+IFF1Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
