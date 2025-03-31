Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E7A75E83
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 07:14:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tz7TY-0001mJ-CT;
	Mon, 31 Mar 2025 05:14:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1tz7TV-0001lz-W9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 05:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDyw8Lr/f1/ucTSXFmmnlwcHJsWoQKYq8dwZBLxjf7A=; b=kk+/7UTWMHu9MdQFAjAT1DHb+k
 YJgi4BNe0p4sVNm4dD7Rlak2IqptNQOraHYPqVJdLRKKmwoY/jJ2PmJp8rK8UedCXageAiOmzodhJ
 YuKq79NrdqY+noOtd4V7/6rgLh04Z40648FWPFihyYFxlhShCBJ5U59VqM0aLMBwlxYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDyw8Lr/f1/ucTSXFmmnlwcHJsWoQKYq8dwZBLxjf7A=; b=Ov99LM1b4U6TQ0ZFVi1Ee07Rx+
 yNuIsOwuZ/jx0qFJcG/woT26eiOwPbzTZJLrmTzCxphNRBcrWkVRVm1abd5J+t54Ku5RAqS6WaAI6
 bJFHbCwYCxI2hV1/JtC1j+bd7HZlumpgiSjB5NFw+DoROQTyW8iNvuUYjHbeVwTYXt50=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tz7TT-0005T2-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 05:14:18 +0000
X-AuditID: a67dfc59-03fff7000000aab6-da-67ea249b0d08
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 31 Mar 2025 14:13:58 +0900
Message-ID: <20250331051402.2595-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
References: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsXC9ZZnoe4clVfpBv33GS1OTz3LZPFk/Sxm
 iy9Xr7FbXFrkbnF51xw2B1aPnbPusntsWtXJ5rF7wWcmj8+b5AJYorhsUlJzMstSi/TtErgy
 Ji95xlSwLaSif/8e5gbGrU5djJwcEgImEuem3WPsYuQAs3f11oOE2QQ0JP709jKD2CICWhIT
 G/4ClXBxMAt0MkqsP/iZFcQRFtjMKPH39USwKhYBVYkTD9pZQGxeATOJEzffsUMs0JTY8eU8
 E4jNKWAn8ez+XTBbSMBW4t7kr0wQ9YISJ2c+YQE5gllAXWL9PCGQMLOAvETz1tnMILskBBaw
 SZy99xZqpqTEwRU3WCYwCsxC0j4LoX0WkvYFjMyrGEUy88pyEzNzjPWKszMq8zIr9JLzczcx
 AgN4We2fyB2M3y4EH2IU4GBU4uE1UHmZLsSaWFZcmXuIUYKDWUmEN+IrUIg3JbGyKrUoP76o
 NCe1+BCjNAeLkjiv0bfyFCGB9MSS1OzU1ILUIpgsEwenVANjufSSa3eiF8wTubA8bWvHoaPT
 nBZ2770831zBq6Lf9cMLGW2221uqLefymTj1lyucvfHKO21dwZSLR3Y++zAr5MVKwT6jE5/X
 mG3jbjmWp9zjf3aROc8yrWjlsHZ2rStpS4xi3qSsn1UUaDJ/Y+kMZ189bjaz6EdMh14/1tJ6
 a/hN68QElXeblViKMxINtZiLihMB/sOiF1wCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXCNUNlju5slVfpBq+OmFmcnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsFhPmXmWyeL/1HqMDu8fOWXfZPTat6mTz2L3gM5PHt9seHp83yQWw
 RnHZpKTmZJalFunbJXBlTF7yjKlgW0hF//49zA2MW526GDk4JARMJHb11ncxcnKwCWhI/Ont
 ZQaxRQS0JCY2/GXsYuTiYBboZJRYf/AzK4gjLLCZUeLv64lgVSwCqhInHrSzgNi8AmYSJ26+
 YwexJQQ0JXZ8Oc8EYnMK2Ek8u38XzBYSsJW4N/krE0S9oMTJmU9YQI5gFlCXWD9PCCTMLCAv
 0bx1NvMERt5ZSKpmIVTNQlK1gJF5FaNIZl5ZbmJmjplecXZGZV5mhV5yfu4mRmBILqv9M2kH
 47fL7ocYBTgYlXh4DVRepguxJpYVV+YeYpTgYFYS4Y34ChTiTUmsrEotyo8vKs1JLT7EKM3B
 oiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpgZOPfoF12xOHIstMx+bsv+rzdz9Pt2bMi9Hzb
 D5uZNu1i76pNJjJPru+y0dij9OLn9wiHFG2+Z+YWD5+9frky5OLlrEV2X5zKfaW4LnSWOQce
 T1Y1uFkUaf7xlcpZM8Wa2085fJ7sfsg7ea6YzIlZ7Yx7eSo9pPK3T1zZ+nSe9B1BC0nW02cO
 KrEUZyQaajEXFScCAN+bEbtFAgAA
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  >On 2025/3/28 15:25, yohan.joung wrote: >>> On 2025/3/28 11:40,
    yohan.joung wrote: >>>>> From: Chao Yu <chao@kernel.org> >>>>> Sent: Thursday,
    March 27, 2025 10:48 PM >>>>> To: 정요한(JOUNG YOHAN) [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [166.125.252.90 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [166.125.252.90 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tz7TT-0005T2-Ta
Subject: [f2fs-dev] [External Mail] Re: [External Mail] Re: [External Mail]
 Re: [PATCH] f2fs: prevent the current section from being selected as a
 victim during garbage collection
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 pilhyun.kim@sk.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pk9uIDIwMjUvMy8yOCAxNToyNSwgeW9oYW4uam91bmcgd3JvdGU6Cj4+PiBPbiAyMDI1LzMvMjgg
MTE6NDAsIHlvaGFuLmpvdW5nIHdyb3RlOgo+Pj4+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAxMDo0OCBQTQo+Pj4+
PiBUbzog7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFuLmpvdW5nQHNrLmNv
bT47IFlvaGFuIEpvdW5nCj4+Pj4+IDxqeWg0MjlAZ21haWwuY29tPjsgamFlZ2V1a0BrZXJuZWwu
b3JnOyBkYWVobzQzQGdtYWlsLmNvbQo+Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgtCj4+Pj4+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IOq5gO2VhO2YhChLSU0gUElMSFlVTikgTW9iaWxlIEFFCj4+Pj4+IDxwaWxo
eXVuLmtpbUBzay5jb20+Cj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVy
bmFsIE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6Cj4+Pj4+IFtQQVRDSF0gZjJmczogcHJl
dmVudCB0aGUgY3VycmVudCBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYQo+Pj4+PiB2
aWN0aW0gZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbgo+Pj4+Pgo+Pj4+PiBPbiAyMDI1LzMvMjcg
MTY6MDAsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPj4+Pj4+PiBGcm9tOiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAyMDI1IDQ6
MzAgUE0KPj4+Pj4+PiBUbzog7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFu
LmpvdW5nQHNrLmNvbT47IFlvaGFuIEpvdW5nCj4+Pj4+Pj4gPGp5aDQyOUBnbWFpbC5jb20+OyBq
YWVnZXVrQGtlcm5lbC5vcmc7IGRhZWhvNDNAZ21haWwuY29tCj4+Pj4+Pj4gQ2M6IGNoYW9Aa2Vy
bmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4+Pj4+Pj4g
bGludXgtIGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOq5gO2VhO2YhChLSU0gUElMSFlVTikgTW9i
aWxlIEFFCj4+Pj4+Pj4gPHBpbGh5dW4ua2ltQHNrLmNvbT4KPj4+Pj4+PiBTdWJqZWN0OiBbRXh0
ZXJuYWwgTWFpbF0gUmU6IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZzOgo+Pj4+Pj4+
IHByZXZlbnQgdGhlIGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVjdGVkIGFzIGEgdmlj
dGltCj4+Pj4+Pj4gZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24g
My8yNy8yNSAxNDo0MywgeW9oYW4uam91bmdAc2suY29tIHdyb3RlOgo+Pj4+Pj4+Pj4gRnJvbTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+Pj4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDI3LCAyMDI1IDM6MDIgUE0KPj4+Pj4+Pj4+IFRvOiBZb2hhbiBKb3VuZyA8anloNDI5QGdtYWls
LmNvbT47IGphZWdldWtAa2VybmVsLm9yZzsKPj4+Pj4+Pj4+IGRhZWhvNDNAZ21haWwuY29tCj4+
Pj4+Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldDsKPj4+Pj4+Pj4+IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDsoJXs
mpTtlZwoSk9VTkcgWU9IQU4pIE1vYmlsZSBBRQo+Pj4+Pj4+Pj4gPHlvaGFuLmpvdW5nQHNrLmNv
bT4KPj4+Pj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZzOiBw
cmV2ZW50IHRoZSBjdXJyZW50Cj4+Pj4+Pj4+PiBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQg
YXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJhZ2UKPj4+Pj4+Pj4+IGNvbGxlY3Rpb24KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBPbiAzLzI2LzI1IDIyOjE0LCBZb2hhbiBKb3VuZyB3cm90ZToKPj4+Pj4+Pj4+
PiBXaGVuIHNlbGVjdGluZyBhIHZpY3RpbSB1c2luZyBuZXh0X3ZpY3RpbV9zZWcgaW4gYSBsYXJn
ZQo+Pj4+Pj4+Pj4+IHNlY3Rpb24sIHRoZSBzZWxlY3RlZCBzZWN0aW9uIG1pZ2h0IGFscmVhZHkg
aGF2ZSBiZWVuIGNsZWFyZWQKPj4+Pj4+Pj4+PiBhbmQgZGVzaWduYXRlZCBhcyB0aGUgbmV3IGN1
cnJlbnQgc2VjdGlvbiwgbWFraW5nIGl0IGFjdGl2ZWx5Cj4+Pj4+Pj4+Pj4gaW4KPj4+IHVzZS4K
Pj4+Pj4+Pj4+PiBUaGlzIGJlaGF2aW9yIGNhdXNlcyBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhl
IFNJVCBhbmQgU1NBLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIg
aXNzdWU/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgaXMgYW4gaXNzdWUgdGhhdCBhcmlzZXMgd2hl
biBkaXZpZGluZyBhIGxhcmdlIHNlY3Rpb24gaW50bwo+Pj4+Pj4+PiBzZWdtZW50cyBmb3IgZ2Fy
YmFnZSBjb2xsZWN0aW9uLgo+Pj4+Pj4+PiBjYXVzZWQgYnkgdGhlIGJhY2tncm91bmQgR0MgKGdh
cmJhZ2UgY29sbGVjdGlvbikgdGhyZWFkIGluIGxhcmdlCj4+Pj4+Pj4+IHNlY3Rpb24KPj4+Pj4+
Pj4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbikgLT4KPj4+Pj4+Pj4gZjJmc19jbGVhcl9wcmVmcmVl
X3NlZ21lbnRzKHZpY3RpbV9zZWN0aW9uKS0+Cj4+Pj4+Pj4+IGN1cnNlYyh2aWN0aW1fc2VjdGlv
bikgLT4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbiBieQo+Pj4+Pj4+PiBuZXh0X3ZpY3RpbV9zZWcp
Cj4+Pj4+Pj4KPj4+Pj4+PiBJIGRpZG4ndCBnZXQgaXQsIHdoeSBmMmZzX2dldF92aWN0aW0oKSB3
aWxsIHJldHVybiBzZWN0aW9uIHdoaWNoCj4+Pj4+Pj4gaXMgdXNlZCBieSBjdXJzZWc/IEl0IHNo
b3VsZCBiZSBhdm9pZGVkIGJ5IGNoZWNraW5nIHcvCj5zZWNfdXNhZ2VfY2hlY2soKS4KPj4+Pj4+
Pgo+Pj4+Pj4+IE9yIHdlIG1pc3NlZCB0byBjaGVjayBnY2luZyBzZWN0aW9uIHdoaWNoIG5leHRf
dmljdGltX3NlZyBwb2ludHMKPj4+Pj4+PiB0byBkdXJpbmcgZ2V0X25ld19zZWdtZW50KCk/Cj4+
Pj4+Pj4KPj4+Pj4+PiBDYW4gdGhpcyBoYXBwZW4/Cj4+Pj4+Pj4KPj4+Pj4+PiBlLmcuCj4+Pj4+
Pj4gLSBiZ2djIHNlbGVjdHMgc2VjICMwCj4+Pj4+Pj4gLSBuZXh0X3ZpY3RpbV9zZWc6IHNlZyAj
MAo+Pj4+Pj4+IC0gbWlncmF0ZSBzZWcgIzAgYW5kIHN0b3AKPj4+Pj4+PiAtIG5leHRfdmljdGlt
X3NlZzogc2VnICMxCj4+Pj4+Pj4gLSBjaGVja3BvaW50LCBzZXQgc2VjICMwIGZyZWUgaWYgc2Vj
ICMwIGhhcyBubyB2YWxpZCBibG9ja3MKPj4+Pj4+PiAtIGFsbG9jYXRlIHNlZyAjMCBpbiBzZWMg
IzAgZm9yIGN1cnNlZwo+Pj4+Pj4+IC0gY3Vyc2VnIG1vdmVzIHRvIHNlZyAjMSBhZnRlciBhbGxv
Y2F0aW9uCj4+Pj4+Pj4gLSBiZ2djIHRyaWVzIHRvIG1pZ3JhdGUgc2VnICMxCj4+Pj4+Pj4KPj4+
Pj4+PiBUaGFua3MsCj4+Pj4+PiBUaGF0J3MgY29ycmVjdAo+Pj4+Pj4gSW4gZjJmc19nZXRfdmlj
dGltLCB3ZSB1c2UgbmV4dF92aWN0aW1fc2VnIHRvIGRpcmVjdGx5IGp1bXAgdG8KPj4+Pj4+IGdv
dF9yZXN1bHQsIHRoZXJlYnkgYnlwYXNzaW5nIHNlY191c2FnZV9jaGVjayBXaGF0IGRvIHlvdSB0
aGluawo+Pj4+Pj4gYWJvdXQgdGhpcyBjaGFuZ2U/Cj4+Pj4+Pgo+Pj4+Pj4gQEAgLTg1MCwxNSAr
ODUwLDIwIEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbwo+Pj4+Pj4g
KnNiaSwKPj4+Pj4gdW5zaWduZWQgaW50ICpyZXN1bHQsCj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dDXTsKPj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICpyZXN1bHQgPSBwLm1pbl9zZWdubzsKPj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dD
XSA9IE5VTExfU0VHTk87Cj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGdvdF9y
ZXN1bHQ7Cj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgIGlmIChnY190eXBlID09IEZHX0dDICYmCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSAhPSBOVUxMX1NFR05PKQo+
ewo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgcC5taW5fc2Vnbm8gPSBzYmktPm5l
eHRfdmljdGltX3NlZ1tGR19HQ107Cj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAq
cmVzdWx0ID0gcC5taW5fc2Vnbm87Cj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
YmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10gPSBOVUxMX1NFR05POwo+Pj4+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0Owo+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
IH0KPj4+Pj4+ICsKPj4+Pj4+ICsgICAgICAgICAgICAgICBzZWNubyA9IEdFVF9TRUNfRlJPTV9T
RUcoc2JpLCBzZWdubyk7Cj4+Pj4+PiArCj4+Pj4+PiArICAgICAgICAgICAgICAgaWYgKHNlY191
c2FnZV9jaGVjayhzYmksIHNlY25vKSkKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gbmV4dDsKPj4+Pj4+ICsKPj4+Pj4+ICsgICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7
Cj4+Pj4+PiAgICAgICAgICAgIH0KPj4+Pj4KPj4+Pj4gQnV0IHN0aWxsIGFsbG9jYXRvciBjYW4g
YXNzaWduIHRoaXMgc2VnbWVudCBhZnRlciBzZWNfdXNhZ2VfY2hlY2soKQo+Pj4+PiBpbiByYWNl
IGNvbmRpdGlvbiwgcmlnaHQ/Cj4+Pj4gU2luY2UgdGhlIEJHIEdDIHVzaW5nIG5leHRfdmljdGlt
ICB0YWtlcyBwbGFjZSBhZnRlciB0aGUgU0lUIHVwZGF0ZQo+Pj4+IGluIGRvX2NoZWNrcG9pbnQs
IGl0IHNlZW1zIHVubGlrZWx5IHRoYXQgYSByYWNlIGNvbmRpdGlvbiB3aXRoCj4+PiBzZWNfdXNh
Z2VfY2hlY2sgd2lsbCBvY2N1ci4KPj4+Cj4+PiBJIG1lYW4gdGhpczoKPj4+Cj4+PiAtIGdjX3Ro
cmVhZAo+Pj4gICAgLSBmMmZzX2djCj4+PiAgICAgLSBmMmZzX2dldF92aWN0aW0KPj4+ICAgICAg
LSBzZWNfdXNhZ2VfY2hlY2sgLS0tIHNlZ25vICMxIGlzIG5vdCB1c2VkIGluIGFueSBjdXJzZWdz
Cj4+PiAJCQkJCS0gZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrCj4+PiAJCQkJCSAtIG5ld19jdXJz
ZWcKPj4+IAkJCQkJICAtIGdldF9uZXdfc2VnbWVudCBmaW5kIHNlZ25vICMxCj4+Pgo+Pj4gICAg
IC0gZG9fZ2FyYmFnZV9jb2xsZWN0Cj4+Pgo+Pj4gVGhhbmtzLAo+Pgo+PiAJCQkJCQkgIGRvX2No
ZWNrcG9pbnQgc2VjMCBmcmVlCj4+IAkJCQkJCSAgSWYgc2VjMCBpcyBub3QgZnJlZWQsIHRoZW4K
PnNlZ25vMSB3aXRoaW4gc2VjMCBjYW5ub3QgYmUKPj4gYWxsb2NhdGVkCj4+IC0gZ2NfdGhyZWFk
Cj4+ICAgIC0gZjJmc19nYwo+PiAgICAgLSBmMmZzX2dldF92aWN0aW0KPj4gICAgICAtIHNlY191
c2FnZV9jaGVjayAgLS0tIHNlZ25vICMxIGlzIG5vdCB1c2VkIGluIGFueSBjdXJzZWdzIChidXQg
c2VjMAo+aXMgYWxyZWFkeSB1c2VkKQo+PiAJCQkJCQkJLSBmMmZzX2FsbG9jYXRlX2RhdGFfYmxv
Y2sKPj4gCQkJCQkJCS0gbmV3X2N1cnNlZwo+PiAJCQkJCQkJLSBnZXRfbmV3X3NlZ21lbnQgZmlu
ZAo+c2Vnbm8gIzEKPj4KPj4gICAgIC0gZG9fZ2FyYmFnZV9jb2xsZWN0Cj4+Cj4+IEkgYXBwcmVj
aWF0ZSB5b3VyIHBhdGNoLCBpdCBpcyB1bmRlciB0ZXN0aW5nLgo+PiBidXQgSSdtIHdvbmRlcmlu
ZyBpZiB0aGVyZSdzIGEgcmlzayBvZiBhIHJhY2UgY29uZGl0aW9uIGluIHRoaXMKPj4gc2l0dWF0
aW9uCj4KPk9oLCB5ZXMsIEkgbWF5IG1pc3NlZCB0aGF0IGdldF9uZXdfc2VnbWVudCBjYW4gcmV0
dXJuIGEgZnJlZSBzZWdtZW50IGluCj5wYXJ0aWFsIHVzZWQgc2VjdGlvbi4KPgo+U28gd2hhdCBk
byB5b3UgdGhpbmsgb2YgdGhpcz8KPi0gY2hlY2sgQ1VSU0VHKCkgaW4gZG9fZ2FyYmFnZV9jb2xs
ZWN0KCkgYW5kIGdldF92aWN0aW0oKQo+LSByZXNldCBuZXh0X3ZpY3RpbV9zZWdbXSBpbiBnZXRf
bmV3X3NlZ21lbnQoKSBhbmQgX19zZXRfdGVzdF9hbmRfZnJlZSgpCj5kdXJpbmcgY2hlY2twb2lu
dC4KPgo+VGhhbmtzLAoKSG93IGFib3V0IHVzaW5nIHZpY3RpbV9zZWNtYXA/CmdjX3RocmVhZAoJ
CQkJbXV0ZXhfbG9jaygmRElSVFlfSShzYmkpLT5zZWdsaXN0X2xvY2spOwoJCQkJX19zZXRfdGVz
dF9hbmRfZnJlZQoJCQkJY2hlY2sgY3VyIHNlY3Rpb24gbmV4dF92aWN0aW0gY2xlYXIgCgkJCQlt
dXRleF91bmxvY2soJmRpcnR5X2ktPnNlZ2xpc3RfbG9jayk7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKbXV0ZXhfbG9jaygmZGlydHktPnNlZ2xpc3RfbG9jayk7CmYy
ZnNfZ2V0X3ZpY3RpbQptdXRleF91bmxvY2soJmRpcnR5X2ktPnNlZ2xpc3RfbG9jayk7CgpzdGF0
aWMgaW5saW5lIHZvaWQgX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCiAgICAgICAgICAgICAgICBpZiAobmV4dCA+PSBzdGFydF9zZWdubyArIHVzYWJsZV9zZWdz
KSB7CiAgICAgICAgICAgICAgICAgICAgICAgIGlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8s
IGZyZWVfaS0+ZnJlZV9zZWNtYXApKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZy
ZWVfaS0+ZnJlZV9zZWN0aW9ucysrOworCisgICAgICAgICAgICAgICAgICAgICAgIGlmICh0ZXN0
X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGRpcnR5X2ktPnZpY3RpbV9zZWNtYXApKQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dDXSA9IE5VTExf
U0VHTk87CiAgICAgICAgICAgICAgICB9CiAgICAgICAgfQo+Cj4+Cj4+Cj4+Pgo+Pj4+Pgo+Pj4+
PiBJTU8sIHdlIGNhbiBjbGVhciBuZXh0X3ZpY3RpbV9zZWdbXSBvbmNlIHNlY3Rpb24gaXMgZnJl
ZSBpbgo+Pj4+PiBfX3NldF90ZXN0X2FuZF9mcmVlKCk/IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+
Pj4gSSB3aWxsIHRlc3QgaXQgYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbi4KPj4+PiBJZiB0
aGVyZSBhcmUgbm8gaXNzdWVzLCBjYW4gSSBzdWJtaXQgaXQgYWdhaW4gd2l0aCB0aGUgcGF0Y2g/
Cj4+Pj4gVGhhbmtzCj4+Pj4+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgZnMvZjJmcy9zZWdtZW50Lmgg
fCAxMyArKysrKysrKysrLS0tCj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2Vn
bWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmggaW5kZXgKPj4+Pj4gMDQ2NWRjMDBiMzQ5Li44MjZl
Mzc5OTkwODUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oCj4+Pj4+ICsrKyBi
L2ZzL2YyZnMvc2VnbWVudC5oCj4+Pj4+IEBAIC00NzMsOSArNDczLDE2IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBfX3NldF90ZXN0X2FuZF9mcmVlKHN0cnVjdAo+Pj4+PiBmMmZzX3NiX2luZm8gKnNi
aSwKPj4+Pj4gICAgIAkJCWdvdG8gc2tpcF9mcmVlOwo+Pj4+PiAgICAgCQluZXh0ID0gZmluZF9u
ZXh0X2JpdChmcmVlX2ktPmZyZWVfc2VnbWFwLAo+Pj4+PiAgICAgCQkJCXN0YXJ0X3NlZ25vICsg
U0VHU19QRVJfU0VDKHNiaSksCj5zdGFydF9zZWdubyk7Cj4+Pj4+IC0JCWlmIChuZXh0ID49IHN0
YXJ0X3NlZ25vICsgdXNhYmxlX3NlZ3MpIHsKPj4+Pj4gLQkJCWlmICh0ZXN0X2FuZF9jbGVhcl9i
aXQoc2Vjbm8sIGZyZWVfaS0+ZnJlZV9zZWNtYXApKQo+Pj4+PiAtCQkJCWZyZWVfaS0+ZnJlZV9z
ZWN0aW9ucysrOwo+Pj4+PiArCQlpZiAoKG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2Vn
cykgJiYKPj4+Pj4gKwkJCXRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZnJlZV9pLT5mcmVlX3Nl
Y21hcCkpIHsKPj4+Pj4gKwkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+Pj4+PiArCj4+Pj4+
ICsJCQlpZiAoR0VUX1NFQ19GUk9NX1NFRyhzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ10pID09
Cj4+Pj4+ICsJCQkJCQkJCQlzZWNubykKPj4+Pj4gKwkJCQlzYmktPm5leHRfdmljdGltX3NlZ1tC
R19HQ10gPSBOVUxMX1NFR05POwo+Pj4+PiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5u
ZXh0X3ZpY3RpbV9zZWdbRkdfR0NdKSA9PQo+Pj4+PiArCQkJCQkJCQkJc2Vjbm8pCj4+Pj4+ICsJ
CQkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4gICAgIAkJ
fQo+Pj4+PiAgICAgCX0KPj4+Pj4gICAgIHNraXBfZnJlZToKPj4+Pj4gLS0KPj4+Pj4gMi40MC4x
Cj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQmVjYXVzZSB0aGUgY2FsbCBzdGFjayBp
cyBkaWZmZXJlbnQsIEkgdGhpbmsgdGhhdCBpbiBvcmRlciB0bwo+Pj4+Pj4+PiBoYW5kbGUgZXZl
cnl0aGluZyBhdCBvbmNlLCB3ZSBuZWVkIHRvIGFkZHJlc3MgaXQgd2l0aGluCj4+Pj4+Pj4+IGRv
X2dhcmJhZ2VfY29sbGVjdCwgb3Igb3RoZXJ3aXNlIGluY2x1ZGUgaXQgb24gYm90aCBzaWRlcy4K
Pj4+Pj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFszMDE0Ni4zMzc0
NzFdWyBUMTMwMF0gRjJGUy1mcyAoZG0tNTQpOiBJbmNvbnNpc3RlbnQgc2VnbWVudAo+Pj4+Pj4+
PiAoNzA5NjEpIHR5cGUgWzAsIDFdIGluIFNTQSBhbmQgU0lUIFszMDE0Ni4zNDYxNTFdWyBUMTMw
MF0gQ2FsbAo+dHJhY2U6Cj4+Pj4+Pj4+IFszMDE0Ni4zNDYxNTJdWyBUMTMwMF0gIGR1bXBfYmFj
a3RyYWNlKzB4ZTgvMHgxMGMKPj4+Pj4+Pj4gWzMwMTQ2LjM0NjE1N11bIFQxMzAwXSAgc2hvd19z
dGFjaysweDE4LzB4MjggWzMwMTQ2LjM0NjE1OF1bCj4+Pj4+Pj4+IFQxMzAwXSBkdW1wX3N0YWNr
X2x2bCsweDUwLzB4NmMgWzMwMTQ2LjM0NjE2MV1bIFQxMzAwXQo+Pj4+Pj4+PiBkdW1wX3N0YWNr
KzB4MTgvMHgyOCBbMzAxNDYuMzQ2MTYyXVsgVDEzMDBdCj4+Pj4+Pj4+IGYyZnNfc3RvcF9jaGVj
a3BvaW50KzB4MWMvMHgzYyBbMzAxNDYuMzQ2MTY1XVsgVDEzMDBdCj4+Pj4+Pj4+IGRvX2dhcmJh
Z2VfY29sbGVjdCsweDQxYy8weDI3MWMgWzMwMTQ2LjM0NjE2N11bIFQxMzAwXQo+Pj4+Pj4+PiBm
MmZzX2djKzB4MjdjLzB4ODI4IFszMDE0Ni4zNDYxNjhdWyBUMTMwMF0KPj4+Pj4+Pj4gZ2NfdGhy
ZWFkX2Z1bmMrMHgyOTAvMHg4OGMgWzMwMTQ2LjM0NjE2OV1bIFQxMzAwXQo+Pj4+Pj4+PiBrdGhy
ZWFkKzB4MTFjLzB4MTY0IFszMDE0Ni4zNDYxNzJdWyBUMTMwMF0KPj4+Pj4+Pj4gcmV0X2Zyb21f
Zm9yaysweDEwLzB4MjAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gc3RydWN0IGN1cnNlZ19pbmZvIDogMHhm
ZmZmZmY4MDNmOTVlODAwIHsKPj4+Pj4+Pj4gCXNlZ25vICAgICAgICA6IDB4MTE1MzEgOiA3MDk2
MQo+Pj4+Pj4+PiB9Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IHN0cnVjdCBmMmZzX3NiX2luZm8gOiAweGZm
ZmZmZjg4MTFkMTIwMDAgewo+Pj4+Pj4+PiAJbmV4dF92aWN0aW1fc2VnWzBdIDogMHgxMTUzMSA6
IDcwOTYxIH0KPj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUwMzI1MDgwNjQ2LjMyOTE5NDcKPj4+Pj4+Pj4+IC0y
Cj4+Pj4+Pj4+PiAtCj4+Pj4+Pj4+PiBjaGFvQGtlcm5lbC5vcmcKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
PiBUaGFua3MsCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
WW9oYW4gSm91bmcgPHlvaGFuLmpvdW5nQHNrLmNvbT4KPj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+
PiAgICAgZnMvZjJmcy9nYy5jIHwgNCArKysrCj4+Pj4+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2djLmMgYi9mcy9mMmZzL2djLmMgaW5kZXgKPj4+Pj4+Pj4+PiAyYjhmOTIzOWJlZGUuLjRi
NWQxOGUzOTVlYiAxMDA2NDQKPj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+Pj4+Pj4+
PiArKysgYi9mcy9mMmZzL2djLmMKPj4+Pj4+Pj4+PiBAQCAtMTkyNiw2ICsxOTI2LDEwIEBAIGlu
dCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+Pj4+PiBzdHJ1Y3QKPj4+
Pj4+Pj4+IGYyZnNfZ2NfY29udHJvbCAqZ2NfY29udHJvbCkKPj4+Pj4+Pj4+PiAgICAgCQlnb3Rv
IHN0b3A7Cj4+Pj4+Pj4+Pj4gICAgIAl9Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiArCWlmIChfX2lz
X2xhcmdlX3NlY3Rpb24oc2JpKSAmJgo+Pj4+Pj4+Pj4+ICsJCQlJU19DVVJTRUMoc2JpLCBHRVRf
U0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pKSkKPj4+Pj4+Pj4+PiArCQlnb3RvIHN0b3A7Cj4+Pj4+
Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICAgICAJc2VnX2ZyZWVkID0gZG9fZ2FyYmFnZV9jb2xsZWN0KHNi
aSwgc2Vnbm8sICZnY19saXN0LCBnY190eXBlLAo+Pj4+Pj4+Pj4+ICAgICAJCQkJZ2NfY29udHJv
bC0+c2hvdWxkX21pZ3JhdGVfYmxvY2tzLAo+Pj4+Pj4+Pj4+ICAgICAJCQkJZ2NfY29udHJvbC0+
b25lX3RpbWUpOwo+Pj4+Pj4+Pgo+Pj4+Pj4KPj4+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
