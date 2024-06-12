Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C58904A48
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 06:51:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHFxA-0003ww-TH;
	Wed, 12 Jun 2024 04:51:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sHFx9-0003wn-5I
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 04:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MS87o5SRN8topXTaNuvhNHgnc0qs7VmdJ0nDgVQVRsg=; b=OW0AgrM+14j79pAWrT6AH7YtX1
 HTJfWCP3NiA0an6GaHoqctZw0VsIUAoU4n1HveLZaZhJcWRwqVclVHQse6eddqieaBgcMnI6eB+0d
 gcM8gNb9FvWe+9OY9SLejt4QVyKYcaCoaFn78JNqzxDoFKzujsJmqlz/1eu5zF6kasKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MS87o5SRN8topXTaNuvhNHgnc0qs7VmdJ0nDgVQVRsg=; b=Sa+LKr0jo+O5gShxfsWO8t2DpI
 8ZMl1+p4dKkdnEQUaZwCGUInWLVUJUrtDhByxs9Ov3P6oKD8m+/xayfDU1a3s8ZT29zRz8CBFPzJj
 wStm1cgJ7/c3eacrV1t2fRU7w5FqbtQ5BlvlI/5fd6PcgUdshyzQ0iuPnRG/K2z2vChk=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHFx7-0008Bc-Gn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 04:51:18 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240612045104epoutp0347d30747a6f809549324029f123b43f5~YKJHTGw8z3269232692epoutp03b
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2024 04:51:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240612045104epoutp0347d30747a6f809549324029f123b43f5~YKJHTGw8z3269232692epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1718167864;
 bh=MS87o5SRN8topXTaNuvhNHgnc0qs7VmdJ0nDgVQVRsg=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=bOfLQw/bSf7HgrsA5rqY28yBZ7Y5IeuekCuxrs2LrhFvKtfFjxj7qD3Sf9aa+H5P0
 pTeMESMy6Xkl3bgJ9SKsijFzUngRwfiFuc91fzB+F5/X42cUYLy44K2+t2I0B1orsE
 BYNTL32I8ctfIl2AQUP52mgpohhleCSSTw/olxp4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20240612045103epcas2p37c6792f70352007d6bd91316ccf49774~YKJF42sYG0620806208epcas2p3L;
 Wed, 12 Jun 2024 04:51:03 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.100]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4VzY5f5QMgz4x9Pp; Wed, 12 Jun
 2024 04:51:02 +0000 (GMT)
X-AuditID: b6c32a43-993ff7000000dbb1-ec-66692936f8c6
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 40.F8.56241.63929666; Wed, 12 Jun 2024 13:51:02 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <dfdf7dac-90e2-4ee7-8258-ffca0c777d9e@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240612045001epcms2p2338ee24b2e1f107a72f274f2a88b93e7@epcms2p2>
Date: Wed, 12 Jun 2024 13:50:01 +0900
X-CMS-MailID: 20240612045001epcms2p2338ee24b2e1f107a72f274f2a88b93e7
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmma6ZZmaawccVWhanp55lsnh5SNNi
 1YNwix8nTSx+Pulgs+jf3c5i8WT9LGaLS4vcLS7vmsNm0fLHyeL8xNdMFqs65jJaTD1/hMmB
 12PTqk42j90LPjN59G1ZxejxeZNcAEtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6h
 pYW5kkJeYm6qrZKLT4CuW2YO0GlKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALz
 Ar3ixNzi0rx0vbzUEitDAwMjU6DChOyMZVt3sBZcFKs4un0DWwPjE5EuRk4OCQETiUuz57F3
 MXJxCAnsYJR4tXYlcxcjBwevgKDE3x3CIDXCAu4SO15NZgGxhQSUJNZfnMUOEdeTuPVwDSOI
 zSagIzH9xH2wOSICDxglptzYywbiMAscZJJ4uOosC8Q2XokZ7U+hbGmJ7cu3MoIs4xSwk/jT
 HAsR1pD4sayXGcIWlbi5+i07jP3+2HxGCFtEovXeWagaQYkHP3dDxSUlbs/dBFWfL/H/ynIo
 u0Zi24F5ULa+xLWOjSwQP/pK9L6pAAmzCKhKrNvVDDXGRWL6+zYwm1lAW2LZwtfgIGEW0JRY
 v0sfxJQQUJY4cosFooJPouPwX3aY/xo2/sbK3jHvCROErSax7ud6pgmMyrMQ4TwLya5ZCLsW
 MDKvYhRLLSjOTU9NNiowhEdtcn7uJkZwGtVy3sF4Zf4/vUOMTByMhxglOJiVRHjPxKSnCfGm
 JFZWpRblxxeV5qQWH2I0BfpyIrOUaHI+MJHnlcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5Y
 kpqdmlqQWgTTx8TBKdXAdF3OjmOe7PqNVeLX7klYaatfaKu6Wzkr764Gd7+q3dmi3J3sYvz1
 +hnCB+sECsqOu2wodAj/vFR6nYbrsTDmrQeW7u+/OFdVil8pXWzWvQUuM9iOHhYR474e9ujm
 VJFpaw3CH5l58a11W6W5KfFq7J7ZIstXf167/h27Qt2/DTKGFdfTvJbpcHppZFX9i7Ff2j7V
 v65b/2r1QT2Z7e0rrC4xWfo3/DC86rI7Z+7RFnG/mIglzLN1VHZaz/irP9N97j6+krPLN8oG
 brn6xffH9T+zO2+sbjhoZxBs16CYU7fw9NQIg8vJL7VtnuzyPMqsufSpWo/HlOIMp25moX37
 2jelXS10fS2SI/1R4nuMEktxRqKhFnNRcSIAwl+gRywEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240612022012epcms2p77300b5130d18b0397c9fc2877704949d
References: <dfdf7dac-90e2-4ee7-8258-ffca0c777d9e@kernel.org>
 <20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p7>
 <CGME20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p2>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 2024/6/12 10:20, Daejun Park wrote: > > syzbot reported
 a bug in f2fs_vm_page_mkwrite() which checks for > >
 f2fs_has_inline_data(inode).
 > > The bug was caused by f2fs_convert_inline_inode() not [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHFx7-0008Bc-Gn
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs: fix convert inline inode on
 readonly mode
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
Reply-To: daejun7.park@samsung.com
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiAyMDI0LzYvMTIgMTA6MjAsIERhZWp1biBQYXJrIHdyb3RlOgo+ID4gc3l6Ym90IHJlcG9y
dGVkIGEgYnVnIGluIGYyZnNfdm1fcGFnZV9ta3dyaXRlKCkgd2hpY2ggY2hlY2tzIGZvcgo+ID4g
ZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpLgo+ID4gVGhlIGJ1ZyB3YXMgY2F1c2VkIGJ5IGYy
ZnNfY29udmVydF9pbmxpbmVfaW5vZGUoKSBub3QgcmV0dXJuaW5nIGFuCj4gPiBlcnJvciB3aGVu
IGNhbGxlZCBvbiBhIHJlYWQtb25seSBmaWxlc3lzdGVtLCBidXQgcmV0dXJuaW5nIHdpdGggdGhl
Cj4gPiBpbmxpbmUgYXR0cmlidXRlIGFzIHNldC4KPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIHBy
b2JsZW0gYnkgZW5zdXJpbmcgdGhhdCBmMmZzX2NvbnZlcnRfaW5saW5lX2lub2RlKCkKPiA+IHJl
dHVybnMgLUVST0ZTIG9uIHJlYWRvbmx5Lgo+ID4KPiA+IEZpeGVzOiBlYzJkZGY0OTk0MDIgKCJm
MmZzOiBkb24ndCBhbGxvdyBhbnkgd3JpdGVzIG9uIHJlYWRvbmx5IG1vdW50IikKPiA+IFJlcG9y
dGVkLWJ5OiBzeXpib3QrZjE5NTEyM2E0NWFkNDg3Y2E2NmNAc3l6a2FsbGVyLmFwcHNwb3RtYWls
LmNvbQo+ID4gQ2xvc2VzOiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3YxL3VybD9rPTRm
ZTM2YjM0LTEwNzg1MjUxLTRmZTJlMDdiLTAwMGJhYmZmMzJlMy1lNDIzNWE0OWJiZTE0YTkzJnE9
MSZlPWI3ZWRhOWM0LThkYjItNDc0ZS04MDFkLWYzZWI4NWQzODA2NiZ1PWh0dHBzJTNBJTJGJTJG
c3l6a2FsbGVyLmFwcHNwb3QuY29tJTJGYnVnJTNGZXh0aWQlM0RmMTk1MTIzYTQ1YWQ0ODdjYTY2
Ywo+ID4gU2lnbmVkLW9mZi1ieTogRGFlanVuIFBhcmsgPGRhZWp1bjcucGFya0BzYW1zdW5nLmNv
bT4KPiAKPiBIaSBEYWVqdW4sCj4gCj4gSSBndWVzcyBiZWxvdyBwYXRjaCBoYXMgZml4ZWQgdGhp
cyBpc3N1ZSwgc28gd2UgbmVlZCB0byB0YWcgdGhlIHJlcG9ydAo+IGFzIGR1cGxpY2F0ZWQ/Cj4g
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MDYwMzAxMDc0
NS4yMjQ2NDg4LTEtY2hhb0BrZXJuZWwub3JnL1QvI3UKPiAKPiBUaGFua3MsCgpIaSBDaGFvLAoK
SSBkaWRuJ3QgY2hlY2sgdGhhdCBwYXRjaCwgcGxlYXNlIHNpbXBseSBpZ25vcmUgaXQsIHRoYW5r
IHlvdSA6KQoKVGhhbmtzLApEYWVqdW4KCj4gPiAtLS0KPiA+wqAgZnMvZjJmcy9pbmxpbmUuYyA2
ICsrKystLQ0KPiA+wqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lubGluZS5jIGIvZnMvZjJmcy9p
bmxpbmUuYw0KPiA+IGluZGV4IDc2MzhkMGQ3YjdlZS4uYWUxZDhmMmQ4MmM5IDEwMDY0NA0KPiA+
IC0tLSBhL2ZzL2YyZnMvaW5saW5lLmMNCj4gPiArKysgYi9mcy9mMmZzL2lubGluZS5jDQo+ID4g
QEAgLTIwMywxMCArMjAzLDEyIEBAIGludCBmMmZzX2NvbnZlcnRfaW5saW5lX2lub2RlKHN0cnVj
dCBpbm9kZSAqaW5vZGUpDQo+ID7CoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgcGFnZSAqaXBhZ2UsICpw
YWdlOw0KPiA+wqAgwqAgwqAgwqAgwqAgaW50IGVyciA9IDA7DQo+ID4NCj4gPiAtwqAgwqAgwqAg
aWYgKCFmMmZzX2hhc19pbmxpbmVfZGF0YShpbm9kZSkNCj4gPiAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgZjJmc19od19pc19yZWFkb25seShzYmkpIGYyZnNfcmVhZG9ubHkoc2Jp
LT5zYikpDQo+ID4gK8KgIMKgIMKgIGlmICghZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpKQ0K
PiA+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIDA7DQo+ID4NCj4gPiArwqAgwqAg
wqAgaWYgKHVubGlrZWx5KGYyZnNfaHdfaXNfcmVhZG9ubHkoc2JpKSBmMmZzX3JlYWRvbmx5KHNi
aS0+c2IpKSkNCj4gPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIC1FUk9GUzsNCj4gPiAr
DQo+ID7CoCDCoCDCoCDCoCDCoCBlcnIgPSBmMmZzX2RxdW90X2luaXRpYWxpemUoaW5vZGUpOw0K
PiA+wqAgwqAgwqAgwqAgwqAgaWYgKGVycikNCj4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHJldHVybiBlcnI7DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
