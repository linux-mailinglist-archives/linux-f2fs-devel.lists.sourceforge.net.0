Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639395C0D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 00:26:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shGFn-0000pk-23;
	Thu, 22 Aug 2024 22:26:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1shGFk-0000pP-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 22:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/MU6KgJvG7ddTcuqUsaRiwPMSXbM1laEUvP/S1Qg768=; b=gStEw2hX6TwJIYD0OojHbNgzkF
 8cK2OerpmG9eWPNQjF36/JTntvnmLp8acykZYE6RHhd+fuP7zisaAUQhaq+j/uv4XH9fkNTp/QHF+
 MXM3ZDCGDSOdbK/UQgD70Hyr4Y94V2Eb7dDdEOw2IAtUxNM7FKiGM+qkMo5kErk4VR7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/MU6KgJvG7ddTcuqUsaRiwPMSXbM1laEUvP/S1Qg768=; b=LHPoBfPOadCLc0BNSeOpJ2jyu8
 PT0e0P32X6hFXuihgS8Dj2Uiiaaa6wjpffOwiEYPeSgrw1464sXOdjg/l+3PHCf2tgV4AdjoJg/0T
 2eMY0WIxS0OSnjB6h5hms2OAek93IsF1I1ISTvE8FTxhrJDxdWMZ8iAkthlCIUXpGJA4=;
Received: from mout.gmx.net ([212.227.17.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1shGFj-0005EW-Sb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 22:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1724365537; x=1724970337; i=quwenruo.btrfs@gmx.com;
 bh=/MU6KgJvG7ddTcuqUsaRiwPMSXbM1laEUvP/S1Qg768=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jbpB3nI8aO4MCB+/MbRbjrOq15x+PDwAVNxy0RAobL01s3jrv5KCmZ7se+movdkk
 aEgv9pqjmNDumHkqbMS02qfqAbBgDwmZ0fSZ2WQyBdFznPglU3vvDuFaQiZnGm1A4
 YLm1eNJBKrtrkAEaz4m5LEepZA0L/UGL5b2L7N8OlVfOsYnWtclRxSSCRI9W3Qxo5
 NYEp/K2NuKe5Ui0DWFaSeu2q/lP5Hl/nHxyPqnmmmf6O4eBeKq79RftiUjcX5fvUU
 jUV/raHMsUo4ERzlxkZfOEbMz1Ew8V14Pa5Bj8T8eAIFdLi72X33Xz2tB+RmV7bog
 mKODg38/Tw63N4R5Zg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MBDnC-1sqZNG3uMI-00E3hN; Fri, 23
 Aug 2024 00:25:37 +0200
Message-ID: <38247c40-604b-443a-a600-0876b596a284@gmx.com>
Date: Fri, 23 Aug 2024 07:55:30 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
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
In-Reply-To: <ZscqGAMm1tofHSSG@casper.infradead.org>
X-Provags-ID: V03:K1:/9WKVUdnzyydlFtroztkO05heOwmOHUlvPTrr8IrCIl1eCKv2v9
 X1s+UpR3DY0lx9npliKRqpC+9XhtByy5h5P1/bSp583EnMWj6BH96XYA18iK9KbT2rYXFor
 giqMlXHWV2+81zwILEI5fmoJCQzTDVKFDEqw0zQVLed2v/Y/d0sUgLCcZRNDn0SJGTFbqZh
 D+kYrci7xTbQu+ChiJ0vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hEYuEQ3KozY=;igA7M5AM+n0gRO9BHKW5DF57umv
 WpK8uj0JVl1BTO8FsktwF6NPmtNY7bN1iYUNJoVY7iNmXZQR82crQ3qDaM7AXRXA6t08h1x48
 YryRQBthE+LKvusagS9hj7OQUIv2ZPI79lmrnCKD/wgMx8wMs2TBXwwbq8yZQGjexpBChc37v
 iGM6nS626P9nP2smco9x+GCNQNuTw3wXcShiOpYZQhAZzkJx0C7bIUSIHNBB5k5wlwmK0TWB2
 IuXSybihsq8gjzO51OuTNO1zbWy2XSjSPVS0ZBdVMcy8SJ3tvhyIRvLQgclLa34Zp7++10/dM
 Ts4VbGsOCsoByC2pYAT4NA0vdX4ydRh383GEtbjSVcF+1bXSuKeeWN+eyq9i26HpVnNO0VUUe
 BX98fjbF9hQmRdM0U33+3sfkmytUtatfQ88j8MrZJeVC5/R696i2c2ndlns+cqIl7RVllBybo
 zDkgdP6hp0J4afmLkRLLQLjK77kjgHz+IyRexrN2s/20FaewDoVQrSLNPEu1hPySXqU35qnX5
 D4b7dW2D3G3cCk/97uzTClwA3TrUfGTGM3iLBYrs9yxxfNKLirdArtlSjPF56es91wBVcH5ZR
 m4wSyK01dz44xcNc6KqysqIac8/1FQAMRCXktzNas3ksjUj8IsVsH0RmkCFy1KSHVhIy8DYGs
 eyLidVxgHDvzNXSlTi/S6xgrtd2EsRH8RRiU9RVdaYvWgjTpS1OTg5SY/hJfNmIYrXg7STi/5
 fRQMHWIUpbD5mnfDga5xaO3O2EosTjZdVfodx63DCi45R94E0rfU9zlinhg0wqezPSxZ+KOvS
 IWS+uBwC8K50L2klsQh5US9w==
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/8/22 21:37, Matthew Wilcox 写道: > On Thu, Aug
   22, 2024 at 08:28:09PM +0930, Qu Wenruo wrote: >> 在 2024/8/22 12:35, Matthew
    Wilcox 写道: >>>> - while (cur < page_start + PAGE_SIZE) { >> [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
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
                             [212.227.17.22 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.22 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [quwenruo.btrfs[at]gmx.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [212.227.17.22 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.22 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1shGFj-0005EW-Sb
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

CgrlnKggMjAyNC84LzIyIDIxOjM3LCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4gT24gVGh1LCBB
dWcgMjIsIDIwMjQgYXQgMDg6Mjg6MDlQTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+PiDlnKgg
MjAyNC84LzIyIDEyOjM1LCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4+Pj4gLQl3aGlsZSAoY3Vy
IDwgcGFnZV9zdGFydCArIFBBR0VfU0laRSkgewo+Pj4+ICsJd2hpbGUgKGN1ciA8IGZvbGlvX3N0
YXJ0ICsgUEFHRV9TSVpFKSB7Cj4+Pgo+Pj4gUHJlc3VtYWJseSB3ZSB3YW50IHRvIHN1cHBvcnQg
bGFyZ2UgZm9saW9zIGluIGJ0cmZzIGF0IHNvbWUgcG9pbnQ/Cj4+Cj4+IFllcywgYW5kIHdlJ3Jl
IGFscmVhZHkgd29ya2luZyB0b3dhcmRzIHRoYXQgZGlyZWN0aW9uLgo+Pgo+Pj4gSSBjZXJ0YWlu
bHkgd2FudCB0byByZW1vdmUgQ09ORklHX1JFQURfT05MWV9USFBfRk9SX0ZTIHNvb24gYW5kIHRo
YXQnbGwKPj4+IGJlIGEgYml0IG9mIGEgcmVncmVzc2lvbiBmb3IgYnRyZnMgaWYgaXQgZG9lc24n
dCBoYXZlIGxhcmdlIGZvbGlvCj4+PiBzdXBwb3J0LiAgU28gc2hvdWxkbid0IHdlIGFsc28gcy9Q
QUdFX1NJWkUvZm9saW9fc2l6ZShmb2xpbykvID8KPj4KPj4gQUZBSUsgd2UncmUgb25seSBnb2lu
ZyB0byBzdXBwb3J0IGxhcmdlciBmb2xpb3MgdG8gc3VwcG9ydCBsYXJnZXIgdGhhbgo+PiBQQUdF
X1NJWkUgc2VjdG9yIHNpemUgc28gZmFyLgo+Cj4gV2h5IGRvIHlvdSBub3Qgd2FudCB0aGUgcGVy
Zm9ybWFuY2UgZ2FpbnMgZnJvbSB1c2luZyBsYXJnZXIgZm9saW9zPwo+Cj4+IFNvIGV2ZXJ5IGZv
bGlvIGlzIHN0aWxsIGluIGEgZml4ZWQgc2l6ZSAoc2VjdG9yIHNpemUsID49IFBBR0VfU0laRSku
Cj4+Cj4+IE5vdCBmYW1pbGlhciB3aXRoIHRyYW5zcGFyZW50IGh1Z2UgcGFnZSwgSSB0aG91Z2h0
IHRyYW5zcGFyZW50IGh1Z2UgcGFnZQo+PiBpcyB0cmFuc3BhcmVudCB0byBmcy4KPj4KPj4gT3Ig
ZG8gd2UgbmVlZCBzb21lIHNwZWNpYWwgaGFuZGxpbmc/Cj4+IE15IHVuZWR1Y2F0ZWQgZ3Vlc3Mg
aXMsIHdlIHdpbGwgZ2V0IGEgbGFyZ2VyIGZvbGlvIHBhc3NlZCB0byByZWFkcGFnZQo+PiBjYWxs
IGJhY2sgZGlyZWN0bHk/Cj4KPiBXaHkgZG8geW91IGNob29zZSB0byByZW1haW4gdW5lZHVjYXRl
ZD8gIEl0J3Mgbm90IGxpa2UgSSd2ZSBiZWVuIGtlZXBpbmcKPiBhbGwgb2YgdGhpcyB0byBteXNl
bGYgZm9yIHRoZSBwYXN0IGZpdmUgeWVhcnMuICBJJ3ZlIGdpdmVuIGRvemVucyBvZgo+IHByZXNl
bnRhdGlvbnMgb24gaXQsIGluY2x1ZGluZyBwbGVuYXJ5IHNlc3Npb25zIGF0IExTRk1NLiAgQXMg
YSBmaWxlc3lzdGVtCj4gZGV2ZWxvcGVyLCB5b3UgbXVzdCB3YW50IHRvIG5vdCBrbm93IGFib3V0
IGl0IGF0IHRoaXMgcG9pbnQuCj4KPj4gSXQncyBzdHJhaWdodGZvcndhcmQgZW5vdWdoIHRvIHJl
YWQgYWxsIGNvbnRlbnRzIGZvciBhIGxhcmdlciBmb2xpbywKPj4gaXQncyBubyBkaWZmZXJlbnQg
dG8gc3VicGFnZSBoYW5kbGluZy4KPj4KPj4gQnV0IHdoYXQgd2lsbCBoYXBwZW4gaWYgc29tZSB3
cml0ZXMgaGFwcGVuZWQgdG8gdGhhdCBsYXJnZXIgZm9saW8/Cj4+IERvIE1NIGxheWVyIGRldGVj
dHMgdGhhdCBhbmQgc3BsaXQgdGhlIGZvbGlvcz8gT3IgdGhlIGZzIGhhcyB0byBnbyB0aGUKPj4g
c3VicGFnZSByb3V0aW5lICh3aXRoIGFuIGV4dHJhIHN0cnVjdHVyZSByZWNvcmRpbmcgYWxsIHRo
ZSBzdWJwYWdlIGZsYWdzCj4+IGJpdG1hcCk/Cj4KPiBFbnRpcmVseSB1cCB0byB0aGUgZmlsZXN5
c3RlbS4gIEl0IHdvdWxkIGhlbHAgaWYgYnRyZnMgdXNlZCB0aGUgc2FtZQo+IHRlcm1pbm9sb2d5
IGFzIHRoZSByZXN0IG9mIHRoZSBmaWxlc3lzdGVtcyBpbnN0ZWFkIG9mIGludmVudGluZyBpdHMg
b3duCj4gInN1YnBhZ2UiIHRoaW5nLiAgQXMgZmFyIGFzIEkgY2FuIHRlbGwsICJzdWJwYWdlIiBt
ZWFucyAiZnMgYmxvY2sgc2l6ZSIsCj4gYnV0IG1heWJlIGl0IGhhcyBhIGRpZmZlcmVudCBtZWFu
aW5nIHRoYXQgSSBoYXZlbid0IGFzY2VydGFpbmVkLgoKVGhlbiB0ZWxsIG1lIHRoZSBjb3JyZWN0
IHRlcm1pbm9sb2d5IHRvIGRlc2NyaWJlIGZzIGJsb2NrIHNpemUgc21hbGxlcgp0aGFuIHBhZ2Ug
c2l6ZSBpbiB0aGUgZmlyc3QgcGxhY2UuCgoiZnMgYmxvY2sgc2l6ZSIgaXMgbm90IGdvb2QgZW5v
dWdoLCB3ZSB3YW50IGEgdGVybWlub2xvZ3kgdG8gZGVzY3JpYmUKImZzIGJsb2NrIHNpemUiIHNt
YWxsZXIgdGhhbiBwYWdlIHNpemUuCgo+Cj4gVHJhY2tpbmcgZGlydGluZXNzIG9uIGEgcGVyLWZv
bGlvIGJhc2lzIGRvZXMgbm90IHNlZW0gdG8gYmUgZ29vZCBlbm91Z2guCj4gVmFyaW91cyBwZW9w
bGUgaGF2ZSB3b3JrbG9hZHMgdGhhdCByZWdyZXNzIGluIHBlcmZvcm1hbmNlIGlmIHlvdSBkbwo+
IHRoYXQuICBTbyBoYXZpbmcgc29tZSBkYXRhIHN0cnVjdHVyZSBhdHRhY2hlZCB0byBmb2xpby0+
cHJpdmF0ZSB3aGljaAo+IHRyYWNrcyBkaXJ0aW5lc3Mgb24gYSBwZXItZnMtYmxvY2sgYmFzaXMg
d29ya3MgcHJldHR5IHdlbGwuICBpb21hcCBhbHNvCj4gdHJhY2tzIHRoZSB1cHRvZGF0ZSBiaXQg
b24gYSBwZXItZnMtYmxvY2sgYmFzaXMsIGJ1dCBJJ20gbGVzcyBjb252aW5jZWQKPiB0aGF0J3Mg
bmVjZXNzYXJ5Lgo+Cj4gSSBoYXZlIG5vIGlkZWEgd2h5IGJ0cmZzIHRoaW5rcyBpdCBuZWVkcyB0
byB0cmFjayB3cml0ZWJhY2ssIG9yZGVyZWQsCj4gY2hlY2tlZCBhbmQgbG9ja2VkIGluIGEgYml0
bWFwLiAgVGhvc2UgbWFrZSBubyBzZW5zZSB0byBtZS4gIEJ1dCB0aGV5Cj4gbWFrZSBubyBzZW5z
ZSB0byBtZSBpZiB5b3UncmUgc3VwcG9ydCBhIDRLaUIgZmlsZXN5c3RlbSBvbiBhIG1hY2hpbmUK
PiB3aXRoIGEgNjRLaUIgUEFHRV9TSVpFLCBub3QganVzdCBpbiB0aGUgY29udGV4dCBvZiAibGFy
Z2VyIGZvbGlvcyIuCj4gV3JpdGViYWNrIGlzIHNvbWV0aGluZyB0aGUgVk0gdGVsbHMgeW91IHRv
IGRvOyB3aHkgZG8geW91IG5lZWQgdG8gdGFnCj4gaW5kaXZpZHVhbCBibG9ja3MgZm9yIHdyaXRl
YmFjaz8KCkJlY2F1c2UgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGJ0cmZzIG5lZWRzIHRvIG9ubHkg
d3JpdGUgYmFjayBwYXJ0IG9mIHRoZQpmb2xpbyBpbmRlcGVuZGVudGx5LgoKQW5kIGVzcGVjaWFs
bHkgZm9yIG1peGluZyBjb21wcmVzc2lvbiBhbmQgbm9uLWNvbXByZXNzaW9uIHdyaXRlcyBpbnNp
ZGUKYSBwYWdlLCBlLmc6CgogICAgICAgMCAgICAgMTZLICAgICAzMksgICAgIDQ4SyAgICAgIDY0
SwogICAgICAgfC8vfCAgICAgICAgICB8Ly8vLy8vL3wKICAgICAgICAgIDRLCgpJbiBhYm92ZSBj
YXNlLCBpZiB3ZSBuZWVkIHRvIHdyaXRlYmFjayBhYm92ZSBwYWdlIHdpdGggNEsgc2VjdG9yIHNp
emUsCnRoZW4gdGhlIGZpcnN0IDRLIGlzIG5vdCBzdWl0YWJsZSBmb3IgY29tcHJlc3Npb24gKHJl
c3VsdCB3aWxsIHN0aWxsCnRha2UgYSBmdWxsIDRLIGJsb2NrKSwgd2hpbGUgdGhlIHJhbmdlIFsz
MkssIDQ4Sykgd2lsbCBiZSBjb21wcmVzc2VkLgoKSW4gdGhhdCBjYXNlLCBbMCwgNEspIHJhbmdl
IHdpbGwgYmUgc3VibWl0dGVkIGRpcmVjdGx5IGZvciBJTy4KTWVhbndoaWxlIFszMkssIDQ4KSB3
aWxsIGJlIHN1Ym1pdHRlZCBmb3IgY29tcHJlc3Npb24gaW4gYW50b2hlciB3cS4KKE9yIHRpbWUg
Y29uc3VtaW5nIGNvbXByZXNzaW9uIHdpbGwgZGVsYXkgdGhlIHdyaXRlYmFjayBvZiB0aGUgcmVt
YWluaW5nCnBhZ2VzKQoKVGhpcyBtZWFucyB0aGUgZGlydHkvd3JpdGViYWNrIGZsYWdzIHdpbGwg
aGF2ZSBhIGRpZmZlcmVudCB0aW1pbmcgdG8gYmUKY2hhbmdlZC4KCkkgdGhpbmsgY29tcHJlc3Np
b24gaXMgbm8gbG9uZyBhIGJ0cmZzIGV4Y2x1c2l2ZSBmZWF0dXJlLCB0aHVzIHRoaXMKc2hvdWxk
IGJlIG9idmlvdXM/CgpUaGFua3MsClF1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
