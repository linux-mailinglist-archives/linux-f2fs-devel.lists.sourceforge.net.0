Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 200EFA4B795
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 06:34:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toyRR-0005z0-1Z;
	Mon, 03 Mar 2025 05:34:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1toyRP-0005yu-FV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 05:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T9qWD7tGDCNRB9eH19Ibwdp9u/JsLq46Fdezmgrj/Uc=; b=NGmc6HlkbieEA+kNfkSjOtD4Bh
 zxUgdRrJWwoeH2Rj2RFLiuhv2cYnmQuVUU5Y1zJ+zN6AQNvtWscPqszBqAOXh8orORahI2NnD41F/
 P0HiNOl8NrlO/aKewwPvoLBGh3EM2hakLxQrga0HCi0f5sjjD0KVmch4QUgN9I1v0oX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T9qWD7tGDCNRB9eH19Ibwdp9u/JsLq46Fdezmgrj/Uc=; b=MNxe2nDMXD4+slAxenYY8/fKsX
 GzUWwKNcerZZXI0DKP/X/njr03p4xVBTl/gd+Gr8ZTw4ow54u9SPaxq+PctLwvCoOt+OaKR1R/93v
 aiq4kQ0l2RdU1iMykJt6O+bj7/8WzvQLcFQdsdysZ6ie4N0gBt2PZSWQ9Hvl/YWa8bjE=;
Received: from mout.gmx.net ([212.227.17.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toyRO-00049V-8r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 05:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1740980022; x=1741584822; i=quwenruo.btrfs@gmx.com;
 bh=T9qWD7tGDCNRB9eH19Ibwdp9u/JsLq46Fdezmgrj/Uc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DHoZ8QpkvHb4zAWcuDThjflvGbWCPjVUApiYBrxlxXP5yFUxgyiKBJPwxNZuG7iK
 YoZhkvJhtfyLEAmVs3ebaGtzvGFjpgEj08m8z2QzKEz+EVeLpHET89BPlkycsJV+S
 RjoYRfOCY6ANyFfbFct4Gcso31fBEixeIHI0rPWJIE2E8gi35vvD/UuIkafR980nv
 lOLr3YXabPTChcnUKHAL3qWUr9m5LPGb01cFCbQKCeIB0siGuFIRpsow3/oJ+qHdA
 QFOtqeLvSKrTi1sb+WvEbYWaIhZ8WYEPBFOAI0NmqVooouYsL0HiobUZdw/HgGKF2
 Y2mFB8lPu2vDF0C4Fw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MHG8m-1u27ZV1TRw-00Fzbo; Mon, 03
 Mar 2025 06:33:41 +0100
Message-ID: <5b361973-5b31-4bb7-9229-fe2e7ed7969f@gmx.com>
Date: Mon, 3 Mar 2025 16:03:37 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <14bd34c8-8fe0-4440-8dfd-e71223303edc@gmx.com>
 <Z8U1f4g5av7L1Tv-@casper.infradead.org>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <Z8U1f4g5av7L1Tv-@casper.infradead.org>
X-Provags-ID: V03:K1:jGLn0ulbVhrQ7XGi+wvnOD91hEzkcflzJ7sRSkozhYhTjGqGzcm
 cpEjFD7CZoh0LDccv9erJ7NNJdvHMgwuLdkAzbApMAxMxXno3S+YkLBuNwlrj7CG1SJVGeo
 5lW77KNRG6tysmk/mKKlr5lahBWklQ6LxDUGVn78SLB2FzcbSMY31AQKqfFjAeQcssviNtA
 UTOe4uB6t6fe5RTtDesEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A/zZCA22IIc=;bD24oqunkw19dcHcGMb7z3AbcQw
 1taBTpWxGsHOmgFQe9EMvgOUf1N7tJeggG3Ns2RmLgor81p2UFblNZ8G6PD7evzoS3SWkJnm+
 dCU/d3ETaA1g5KDENJJoaQ5tDhOuQWMgYp8Z8CqOiHkCpmvMKBYxsVcfAMcBpzRFaX1LGOeWV
 Ya9GzLC2r/6kIXHfFkW6308LLBOTeJd3uoPHdhddYgu8HNSFGKSi5abqfC6K5Itx9R4kafSSH
 9+R6rKnn6naCyZXFYXEpfRJoQLIVrcTfPlmJkl0XUgwAjYIdL3axS8ZdsMHTXaW68SnpmLQ90
 aOEymo6col0uELjSxfjATv55rF/evunyEnw1ne2NCtYvqIcDS3KJTr1KsQCLcnikgfrqy9MYj
 wizZuMwl0ocaQh5a/HO9WHbMwwGCqTcUVxwNMOjws43hjr65ZoUtts8UAYTyvHM6NzZpdTO26
 JlQVvDiVmCQzCGP1fc8YkwZ9xSyAESngPeiGNB9GTGaYb1I0W23t0ZGFel0jzQqvmIRvYug0J
 tKQA4TAnJk1xixhk/7ZqCnvTI7/DkkkZjpi0oxgdTtYtuaxfiaLFI6ztMyEKN/zIgMxZuxVPl
 WRvHwEwgwVlYOqOaZeITdxRMoYtQk6RidyqCsA4wWkBchqyvVhlt0BWsMkuoVrWmJuXx9eqEt
 z6mlLNeO3pZWOQJrU/xCuXHbXdLWbaco64YI1ooqdxyMLXm/LWBuxH67rAQcKHKgTGJ1fMk/s
 MaOk9IY9Uq5NnVkXTj5WeMbuszBjElmJPx0qA7J8qlyoR1sOrHoVBo6Ht/KTaIWoLtOunJtlP
 lAExvxSbAdrW3rZvRIOHxekkinhEYghyRQ2kfO1zPthlZ8d6jIdDHiTGJJyfw8ZpN12tZzVgy
 cidPB2MgsWstDbuc06o4wQ8vgreuKfd2x1I+TcLOPAiXrvHrb+hk8DR+qcdx2ro28ADR97woM
 gnsNkrjUP/70rxcGwampnH5UD2HGNai3PeZ/z/iFB11TyT7lbL1Q+R+iYhRQue+dazVlAINle
 9Dv4rGffFhJnVnfQ9SCrPvCrtgoI24SyMihEscwOrsX/HYOVNMWkhMH3gvMEZLZLGWQVKKr0+
 VgXIuZNqORihkHLgKv/S9ZTJVeL2KIAdN5FxeL0d1Ap4UXYFsk6nV1ZcT6LX/EVXHG6eOhPlq
 2446wVMnFk26vSc8Xhrr15IBcUiExwcpCwx4apzmPbKG/WFuLgx6mREPKdDCijJPJgn9CSKbw
 0odyAvZDzAVVIsND5IhwklcTNhNYXmsKSYjjwhdJr5EB8T9JOGgq0og62Skj0Ale8iP6VLdB7
 nbbp8rIsnFqq5OUwJdl033ItpwrpeMXm2h4JAAmIWjvf/KZsaCMX3fVNSQ9/WHuxDj/yMRiBa
 4pNm9qK8elssLL34Nk94T7I3KoRGQIlnX3N4WgIAXzvcwE2iQjlgPZ2+HB
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/3/3 15:22, Matthew Wilcox 写道: > Adding Jens to
    the cc. As you well know, he added this code, so I'm > mystified why you
   didn't cc him. Also adding linux-fsdevel (I presume > this was a mi [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [212.227.17.20 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.20 listed in bl.score.senderscore.com]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [212.227.17.20 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.20 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [quwenruo.btrfs[at]gmx.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1toyRO-00049V-8r
Subject: Re: [f2fs-dev] Calling folio_end_writeback() inside a spinlock
 under task context?
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS8zLzMgMTU6MjIsIE1hdHRoZXcgV2lsY294IOWGmemBkzoKPiBBZGRpbmcgSmVu
cyB0byB0aGUgY2MuICBBcyB5b3Ugd2VsbCBrbm93LCBoZSBhZGRlZCB0aGlzIGNvZGUsIHNvIEkn
bQo+IG15c3RpZmllZCB3aHkgeW91IGRpZG4ndCBjYyBoaW0uICBBbHNvIGFkZGluZyBsaW51eC1m
c2RldmVsIChJIHByZXN1bWUKPiB0aGlzIHdhcyBhIG1pc3Rha2UgYW5kIHlvdSBpbmFkdmVydGVu
dGx5IGNjJ2QgZjJmcy1kZXZlbCBpbnN0ZWFkLikKPgo+IE9uIE1vbiwgTWFyIDAzLCAyMDI1IGF0
IDEwOjM0OjI2QU0gKzEwMzAsIFF1IFdlbnJ1byB3cm90ZToKPj4gW1NQSU5MT0NLIEFORCBFTkQg
V1JJVEVCQUNLXQo+Pgo+PiBBbHRob3VnaCBmb2xpb19lbmRfd3JpdGViYWNrKCkgY2FuIGJlIGNh
bGxlZCBpbiBhbiBpbnRlcnJ1cHRpb24gY29udGV4dAo+PiAoYnkgdGhlIGluX3Rhc2soKSBjaGVj
ayksIHN1cnByaXNpbmdseSBpdCBtYXkgbm90IGJlIHN1aXRhYmxlIHRvIGJlCj4+IGNhbGxlZCBp
bnNpZGUgYSBzcGlubG9jayAoaW4gdGFzayBjb250ZXh0KToKPgo+IEl0J3MgcG9vciBwcmFjdGlj
ZSB0byBkbyB0aGF0OyB5b3UncmUgaW50cm9kdWNpbmcgYSBkZXBlbmRlbmN5IGJldHdlZW4KPiB5
b3VyIGZzIGxvY2sgYW5kIHRoZSBpX21hcHBpbmcgbG9jaywgd2hpY2ggaXMgYWxyZWFkeSBwcmV0
dHkgaW50ZXJ0d2luZWQKPiB3aXRoIC4uLiBldmVyeSBvdGhlciBsb2NrIGluIHRoZSBzeXN0ZW0u
Cj4KPj4gRm9yIGV4YW1wbGUgdGhlIGZvbGxvd2luZyBjYWxsIGNoYWluIGNhbiBsZWFkIHRvIHNs
ZWVwOgo+Pgo+PiBzcGluX2xvY2soKQo+PiBmb2xpb19lbmRfd3JpdGViYWNrKCkKPj4gfC0gZm9s
aW9fZW5kX2Ryb3BiZWhpbmRfd3JpdGUoKQo+PiAgICAgfC0gZm9saW9fbGF1bmRlcigpCj4+ICAg
ICAgICBXaGljaCBjYW4gc2xlZXAuCj4+Cj4+IE15IHF1ZXN0aW9uIGlzLCBjYW4gYW5kIHNob3Vs
ZCB3ZSBhbGxvdyBmb2xpb19lbmRfd3JpdGViYWNrKCkgaW5zaWRlIGEKPj4gc3BpbmxvY2s/Cj4+
Cj4+IFtCVFJGUycgQVNZTkMgRVhURU5UIFBST0JMRU1dCj4+Cj4+IFRoaXMgaXMgYWdhaW4gYSBi
dHJmcyBzcGVjaWZpYyBiZWhhdmlvciwgdGhhdCB3ZSBoYXZlIHRvIGNhbGwKPj4gZm9saW9fZW5k
X3dyaXRlYmFjaygpIGluc2lkZSBhIHNwaW5sb2NrIHRvIG1ha2Ugc3VyZSByZWFsbHkgb25seSBv
bmUKPj4gdGhyZWFkIGNhbiBjbGVhciB0aGUgd3JpdGViYWNrIGZsYWcgb2YgYSBmb2xpby4KPj4K
Pj4gSSBrbm93IGlvbWFwIGlzIGRvaW5nIGEgcHJldHR5IGdvb2Qgam9iIHByZXZlbnRpbmcgZWFy
bHkgZmluaXNoZWQKPj4gd3JpdGViYWNrIHRvIGNsZWFyIHRoZSBmb2xpbyB3cml0ZWJhY2sgZmxh
ZywgbWVhbndoaWxlIHdlJ3JlIHN0aWxsCj4+IHN1Ym1pdHRpbmcgb3RoZXIgYmxvY2tzIGluc2lk
ZSB0aGUgZm9saW8uCj4+Cj4+IElvbWFwIGdvZXMgaG9sZGluZyBvbmUgZXh0cmEgd3JpdGViYWNr
IGNvdW50IGJlZm9yZSBzdGFydGluZyBtYXJraW5nCj4+IGJsb2NrcyB3cml0ZWJhY2sgYW5kIHN1
Ym1pdHRpbmcgdGhlbS4KPj4gQW5kIGFmdGVyIGFsbCBibG9ja3MgYXJlIHN1Ym1pdHRlZCwgcmVk
dWNlIHRoZSB3cml0ZWJhY2sgY291bnQgKGFuZCBjYWxsCj4+IGZvbGlvX2VuZF93cml0ZWJhY2so
KSBpZiBpdCdzIHRoZSBsYXN0IG9uZSBob2xkaW5nIHRoZSB3cml0ZWJhY2sgZmxhZykuCj4+Cj4+
IEJ1dCB0aGUgaW9tYXAgc29sdXRpb24gcmVxdWlyZXMgdGhhdCwgYWxsIGJsb2NrcyBpbnNpZGUg
YSBmb2xpbyB0byBiZQo+PiBzdWJtaXR0ZWQgYXQgdGhlIHNhbWUgdGltZS4KPgo+IEkgYWFjdHVh
bGx5IGRvbid0IGxpa2UgdGhlIGlvbWFwIHNvbHV0aW9uIGFzIGl0J3MgY3VycmVudGx5IHdyaXR0
ZW47IGl0Cj4ganVzdCBoYXNuJ3QgcmlzZW4gaGlnaCBlbm91Z2ggdXAgbXkgdG9kbyBsaXN0IHRv
IGZpeCBpdC4KPgo+IFdoYXQgd2Ugc2hvdWxkIGRvIGlzIGluaXRpYWxpc2UgZm9saW8tPmlmcy0+
d3JpdGVfYnl0ZXNfcGVuZGluZyB0bwo+IGJpdG1hcF93ZWlnaHQoaWZzLT5zdGF0ZSwgYmxvY2tz
X3Blcl9mb2xpbykgKiBibG9ja19zaXplIGluCj4gaW9tYXBfd3JpdGVwYWdlX21hcCgpIFt0aGlz
IGlzIG92ZXJzaW1wbGlmaWVkOyB3ZSdkIG5lZWQgdG8gaGFuZGxlIGVvZgo+IGFuZCBzbyBvbiB0
b29dCgpTbyB5b3UgbWVhbiBzZXR0aW5nIGV2ZXJ5IGJsb2NrIHdyaXRlYmFjayAoSSBrbm93IGlv
bWFwIGRvZXNuJ3QgdHJhY2sKcGVyLWJsb2NrIHdyaXRlYmFjaykgYXQgdGhlIGJlZ2lubmluZywg
YW5kIGNsZWFyIHRoZSBwZXItYmxvY2sgd3JpdGViYWNrCmZsYWdzIGZvciBob2xlL2VvZiBldGMs
IGFuZCBsZXQgdGhlIHRvLWJlLXN1Ym1pdHRlZCBibG9ja3MgdG8gY29udGludWUKdGhlaXIgZW5k
aW8/CgpUaGF0J3MgaW5kZWVkIHNvbHZlcyB0aGUgcHJvYmxlbSB3aXRob3V0IHRoZSBleHRyYSBj
b3VudC4KCkkgY2FuIGdvIGRlZmluaXRlbHkgdGhhdCBzb2x1dGlvbiBpbiBidHJmcyBmaXJzdC4K
Cj4KPiBUaGF0IHdvdWxkIGFkZHJlc3MgeW91ciBwcm9ibGVtIGFzIHdlbGwgYXMgZG8gZmV3ZXIg
YXRvbWljIG9wZXJhdGlvbnMuCj4KPj4gVGhpcyBpcyBub3QgdHJ1ZSBpbiBidHJmcywgZHVlIHRv
IHRoZSBkZXNpZ24gb2YgYnRyZnMnIGFzeW5jIGV4dGVudCwKPj4gd2hpY2ggY2FuIG1hcmsgdGhl
IGJsb2NrcyBmb3Igd3JpdGViYWNrIHJlYWxseSBhdCBhbnkgdGltaW5nLCBhcyB3ZSBrZWVwCj4+
IHRoZSBsb2NrIG9mIGZvbGlvcyBhbmQgcXVldWUgdGhlbSBpbnRvIGEgd29ya3F1ZXVlIHRvIGRv
IGNvbXByZXNzaW9uLAo+PiB0aGVuIG9ubHkgYWZ0ZXIgdGhlIGNvbXByZXNzaW9uIGlzIGRvbmUs
IHdlIHN1Ym1pdCBhbmQgbWFyayB0aGVtCj4+IHdyaXRlYmFjayBhbmQgdW5sb2NrLgo+Pgo+PiBJ
ZiB3ZSBkbyBub3QgaG9sZCBhIHNwaW5sb2NrIGNhbGxpbmcgZm9saW9fZW5kX3dyaXRlYmFjaygp
LCBidXQgb25seQo+PiBjaGVja3MgaWYgd2UncmUgdGhlIGxhc3QgaG9sZGVyIGFuZCBjYWxsIGZv
bGlvX2VuZF93cml0ZWJhY2soKSBvdXQgb2YKPj4gdGhlIHNwaW5sb2NrLCB3ZSBjYW4gaGl0IHRo
ZSBmb2xsb3dpbmcgcmFjZSB3aGVyZSBmb2xpb19lbmRfd3JpdGViYWNrKCkKPj4gY2FuIGJlIGNh
bGxlZCBvbiB0aGUgc2FtZSBmb2xpbzoKPj4KPj4gICAgICAgMCAgICAgICAgICAzMksgICAgICAg
ICA2NEsKPj4gICAgICAgfDwtIEFFIDEgLT58PC0gQUUgMiAtPnwKPj4KPj4gICAgICAgICAgICAg
IFRocmVhZCBBIChBRSAxKSAgICAgICAgICAgfCAgICAgICAgICAgIFRocmVhZCBCIChBRSAyKQo+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4gc3VibWl0X29uZV9hc3luY19leHRlbnQoKSAgICAgICAgICAgICB8
Cj4+IHwtIHByb2Nlc3Nfb25lX2ZvbGlvKCkgICAgICAgICAgICAgICAgfAo+PiAgICAgICB8LSBz
dWJwYWdlX3NldF93cml0ZWJhY2soKSAgICAgICB8Cj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwKPj4gLyogSU8gZmluaXNoZWQgKi8gICAgICAgICAgICAgICAgICAg
ICB8Cj4+IGVuZF9jb21wcmVzc2VkX3dyaXRlYmFjaygpICAgICAgICAgICAgfAo+PiB8LSBidHJm
c19mb2xpb19jbGVhcl93cml0ZWJhY2soKSAgICAgIHwKPj4gICAgICAgfC0gc3Bpbl9sb2NrKCkg
ICAgICAgICAgICAgICAgICAgfAo+PiAgICAgICB8ICAvKiB0aGlzIGlzIHRoZSBsYXN0IHdyaXRl
YmFjayB8Cj4+ICAgICAgIHwgICAgIGhvbGRlciwgc2hvdWxkIGVuZCB0aGUgICAgIHwKPj4gICAg
ICAgfCAgICAgZm9saW8gd3JpdGViYWNrIGZsYWcgKi8gICAgfAo+PiAgICAgICB8LSBsYXN0ID0g
dHJ1ZSAgICAgICAgICAgICAgICAgICB8Cj4+ICAgICAgIHwtIHNwaW5fdW5sb2NrKCkgICAgICAg
ICAgICAgICAgIHwKPj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBz
dWJtaXRfb25lX2FzeW5jX2V4dGVudCgpCj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgfC0gcHJvY2Vzc19vbmVfZm9saW8oKQo+PiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIHwtIHN1YnBhZ2Vfc2V0X3dyaXRlYmFjaygpCj4KPiBU
aGlzIHNlZW1zIHdlaXJkLiAgV2h5IGFyZSB5b3Ugc2V0dGluZyB0aGUgInN1YnBhZ2UiIHdyaXRl
YmFjayBiaXQKPiB3aGlsZSB0aGUgZm9saW8gd3JpdGViYWNrIGJpdCBpcyBzdGlsbCBzZXQ/ICBU
aGF0IHNtZWxscyBsaWtlIGEKPiBidWctaW4td2FpdGluZyBpZiBub3QgYW4gYWN0dWFsIGJ1ZyB0
byBtZS4gIFN1cmVseSBpdCBzaG91bGQgd2FpdCBvbgo+IHRoZSBmb2xpbyB3cml0ZWJhY2sgYml0
IHRvIGNsZWFyPwoKSSBjb25zaWRlcmVkIHdhaXRpbmcgZm9yIHRoZSB3cml0ZWJhY2ssIGJlZm9y
ZSBzZXR0aW5nIGl0LgpCdXQgaXQgY2FuIHN0aWxsIHJhY2UsIGJldHdlZW4gdGhlIGZvbGlvX3dh
aXRfd3JpdGViYWNrKCkgYW5kIHRoZSBuZXh0CmZvbGlvX3N0YXJ0X3dyaXRlYmFjaygpIGNhbGwu
CgpXaGVyZSBhbm90aGVyIGFzeW5jIGV4dGVudCBjYW4gc3RhcnQgc2V0dGluZyB0aGUgdGhlIGZs
YWcsIGFuZCB3ZSdyZQpoaXR0aW5nIHRoZSBzYW1lIHByb2JsZW0uCgpUaGUga2V5IHByb2JsZW0g
aXMgc3RpbGwgdGhlIGFzeW5jIGV4dGVudCBiZWhhdmlvciwgd2hpY2ggSSBoYXZlIHRvIHNheQpp
cyB3YXkgdG9vIHByb2JsZW1hdGljLCBhbmQgZG9lc24ndCB0YWtlIGZzIGJsb2NrIHNpemUgPCBw
YWdlIHNpemUgY2FzZXMKaW50byBjb25zaWRlcmF0aW9uIGF0IGFsbC4KCj4KPj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAvKiBJTyBmaW5pc2hlZCAqLwo+PiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGVuZF9jb21wcmVzc2VkX3dyaXRl
YmFjaygpCj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgfGJ0cmZz
X2ZvbGlvX2NsZWFyX3dyaXRlYmFjaygpCj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgfCAvKiBBZ2FpbiB0aGUgbGFzdCBob2xkZXIgKi8KPj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICB8LSBzcGluX2xvY2soKQo+PiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIHwtIGxhc3QgPSB0cnVlCj4+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgfC0gc3Bpbl91bmxv
Y2soKQo+PiAgICAgICB8LSBmb2xpb19lbmRfd3JpdGViYWNrKCkgICAgICAgICB8ICAgIHwtIGZv
bGlvX2VuZF93cml0ZWJhY2soKQo+Pgo+PiBJIGtub3cgdGhlIG1vc3QgcHJvcGVyIHNvbHV0aW9u
IHdvdWxkIHRvIGdldCByaWQgb2YgdGhlIGRlbGF5ZWQgdW5sb2NrCj4+IGFuZCBzdWJtaXNzaW9u
LCBidXQgbWFyayBibG9ja3MgZm9yIHdyaXRlYmFjayB3aXRob3V0IHRoZSBhc3luYyBleHRlbnQK
Pj4gbWVjaGFuaXNtIGNvbXBsZXRlbHksIHRoZW4gZm9sbG93IHRoZSBpb21hcCdzIHNvbHV0aW9u
Lgo+Pgo+PiBCdXQgdGhhdCB3aWxsIGJlIGEgaHVnZSBjaGFuZ2UgKGFsdGhvdWdoIHdlIHdpbGwg
Z28gdGhhdCBwYXRoCj4+IGV2ZW50dWFsbHkpLCBtZWFud2hpbGUgdGhlIGZvbGlvX2VuZF93cml0
ZWJhY2soKSBpbnNpZGUgc3BpbmxvY2sgbmVlZHMKPj4gdG8gYmUgZml4ZWQgYXNhcC4KPgo+IEkn
ZCBzdWdnZXN0IHRoZSBhc2FwIHNvbHV0aW9uIGlzIGZvciBidHJmcyB0byBtYXJrIGl0c2VsZiBh
cyBub3QKPiBzdXBwb3J0aW5nIGRyb3BiZWhpbmQuCgpUaGFua3MgYSBsb3QgZm9yIHRoaXMgc29s
dXRpb24sIHRoYXQgaW5kZWVkIHNvbHZlcyB0aGUgcHJvYmxlbSBieQpjb21wbGV0ZWx5IGF2b2lk
IGZvbGlvIHJlbGVhc2UgaW5zaWRlIGZvbGlvX2VuZF93cml0ZWJhY2soKS4KClRoYXQgd2lsbCBi
ZSB0aGUgaG90IGZpeCwgYW5kIHB1c2hlZCBmb3IgYmFja3BvcnRzLgoKSnVzdCB3b25kZXJpbmcg
d2hhdCBlbHNlIHdpbGwgYmUgYWZmZWN0ZWQgb3RoZXIgdGhhbiB0aGUgRE9OVENBQ0hFIHdyaXRl
cz8KCgoKSSBhbHNvIGhhdmUgYSBtaWRkbGUgZ3JvdW5kIHNvbHV0aW9uLCBieSBkaXNhYmxpbmcg
YXN5bmMgZXh0ZW50IGZvcgpyYW5nZXMgd2hpY2ggYXJlIG5vdCBwYWdlIGFsaWduZWQgKHNvIG5v
IG1vcmUgdGhhbiBvbmUgYXN5bmMgcGVyIGZvbGlvLAp0aHVzIG5vIHJhY2UpLCB0aGVuIHVzZSB5
b3VyIGltcHJvdmVkIHdyaXRlYmFjayBmbGFnIHRyYWNraW5nIGFuZCBtb3ZlCnRoZSBmb2xpb19j
bGVhcl93cml0ZWJhY2soKSBvdXQgb2YgdGhlIHNwaW5sb2NrLCBidXQgdGhhdCdzIG5vdCBhIGdv
b2QKY2FuZGlkYXRlIGZvciBiYWNrcG9ydCBhdCBhbGwuLi4KClRoYW5rcywKUXUKCj4KPj4gU28g
bXkgcXVlc3Rpb24gaXMsIGNhbiB3ZSBhbGxvdyBmb2xpb19lbmRfd3JpdGViYWNrKCkgdG8gYmUg
Y2FsbGVkCj4+IGluc2lkZSBhIHNwaW5sb2NrLCBhdCB0aGUgY29zdCBvZiBzY3Jld2luZyB1cCB0
aGUgZm9saW8gcmVjbGFpbSBmb3IKPj4gRE9OVENBQ0hFPwo+Pgo+PiBUaGFua3MsCj4+IFF1Cj4+
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
