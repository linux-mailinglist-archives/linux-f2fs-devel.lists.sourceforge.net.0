Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C41B09B89F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 04:21:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6iDY-000676-L4;
	Fri, 01 Nov 2024 03:20:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t6iDX-00066z-6Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 03:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NgOk2pqSYKhPfI+WJ+rhGXMcoGlZUsU/RrftFmxiUgg=; b=ACkySjd880j5XCBkCHjC0Emyed
 P6V3roXYhIEDR+lJKHyyiYF+jZxNng5OWzuOSLTjWFcNYBMwuEfFYB90qe4x/rr/pPB4yg9nMlRZQ
 WhlxZcA+/2Yzg4olFamUhRwCukdfaPf6gJo1CUZuQHgWz7XXpeuNhXt1gd2ftAKpQMzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NgOk2pqSYKhPfI+WJ+rhGXMcoGlZUsU/RrftFmxiUgg=; b=KU60lvPuR6UjzBjvgp9rZRv9Hw
 L09fs9feRqXjRCwAg2r3qvRad2NzsyiXx1wRo3IeFhf9uIEruYaftNpP+LBzk3akZ8smW1x/C3nOw
 Pa8hxAFm9EiHV5J+MFg4dn1oOCAGF/RB/3EWAzo15jawaans+lN8h1mI0aKB+ph13XbI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6iDX-0004jh-5I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 03:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CFB7BA40571;
 Fri,  1 Nov 2024 03:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351B7C4CEC3;
 Fri,  1 Nov 2024 03:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730431244;
 bh=KTo8Ycxhjjx7uMXl/4YVX6OC2zJoaH2FK4wg6qOisc4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=o5wd6zYiVINoSDB7zsZSymsxzIST1ZCSQpNHDLojT2v7LlmFrbKthgDPebRR5qIrL
 teg2IaNw/rQi1Oorep8ff7grMiIAqC5aCd2/EJOLDHAg2AYxvZRQLs19/5S9sJWSYf
 t2tx81WyDCVkC0LBl2usud/MNRPxsp8vFgCjDpOB+xe2iVhk7zJs58LMjiSbFpCh7G
 lGhd0jquZq/BirmFbLB108jcGGV950LgggRuoFV72QBFk+psfMuwu83mdfbn6DGN7M
 mIqtM3CVl3OyOh1QQPlra+p4a2YvF17p9Xj/8AQvRi8eHiuSa3j7XL5RtMkpVPtdx1
 I+vEwMgenWqZQ==
Message-ID: <af03dd2c-e361-4f80-b2fd-39440766cf6e@kernel.org>
Date: Fri, 1 Nov 2024 11:20:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jinsu1.lee@samsung.com
References: <CGME20241031050939epcms2p7971f1cc52ea141d4a7b29d68427c2fd6@epcms2p7>
 <20241031050939epcms2p7971f1cc52ea141d4a7b29d68427c2fd6@epcms2p7>
Content-Language: en-US
In-Reply-To: <20241031050939epcms2p7971f1cc52ea141d4a7b29d68427c2fd6@epcms2p7>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi jinsu, +Cc f2fs mailing list Thank you for the report. 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6iDX-0004jh-5I
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to force buffered IO on
 inline_data inode
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
Cc: =?UTF-8?B?6rmA7ISx7ZuI?= <seonghun-sui.kim@samsung.com>,
 "v-songbaohua@oppo.com" <v-songbaohua@oppo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?6rmA7KCV7ZWc?= <jh4u.kim@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgamluc3UsCgorQ2MgZjJmcyBtYWlsaW5nIGxpc3QKClRoYW5rIHlvdSBmb3IgdGhlIHJlcG9y
dC4KCkNhbiB5b3UgcGxlYXNlIHRyeSBiZWxvdyBwYXRjaD8KCiBGcm9tIDVhZWI4N2NmZmE3M2Y1
MmIyOWM3ZThkY2MzNzI5MzM3ZjkyNWJiNjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206
IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KRGF0ZTogRnJpLCAxIE5vdiAyMDI0IDExOjE4OjU3
ICswODAwClN1YmplY3Q6IFtQQVRDSF0gZml4CgotLS0KICBmcy9mMmZzL2ZpbGUuYyB8IDIgKy0K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCmluZGV4IDBlN2EwMTk1ZWNhOC4u
ZjY1NmNhM2NjNjFjIDEwMDY0NAotLS0gYS9mcy9mMmZzL2ZpbGUuYworKysgYi9mcy9mMmZzL2Zp
bGUuYwpAQCAtODgzLDcgKzg4Myw3IEBAIHN0YXRpYyBib29sIGYyZnNfZm9yY2VfYnVmZmVyZWRf
aW8oc3RydWN0IGlub2RlICppbm9kZSwgaW50IHJ3KQogIAkJcmV0dXJuIHRydWU7CiAgCWlmIChm
MmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCiAgCQlyZXR1cm4gdHJ1ZTsKLQlpZiAoZjJmc19o
YXNfaW5saW5lX2RhdGEoaW5vZGUpKQorCWlmIChmMmZzX2hhc19pbmxpbmVfZGF0YShpbm9kZSkg
JiYgcncgPT0gUkVBRCkKICAJCXJldHVybiB0cnVlOwoKICAJLyogZGlzYWxsb3cgZGlyZWN0IElP
IGlmIGFueSBvZiBkZXZpY2VzIGhhcyB1bmFsaWduZWQgYmxrc2l6ZSAqLwotLSAKMi40MC4xCgoK
Ck9uIDIwMjQvMTAvMzEgMTM6MDksIOydtOynhOyImCB3cm90ZToKPiBGcm9tOiBqaW5zdSBMRUUg
PGppbnN1MS5sZWVAc2Ftc3VuZy5jb20+Cj4gCj4gVG86IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4KPiAKPiBjYzogamFlZ2V1a0BrZXJuZWwub3JnLCB2LXNvbmdiYW9odWFAb3Bwby5jb20KPiAK
PiAKPiBIaSBDYWhvIFl1Cj4gCj4gSSdtIEppbnN1IExlZSBhbmQgSSB3b3JrIG9uIG1lbW9yeShV
RlMpIGF0IFNhbXN1bmcgRWxlY3Ryb25pY3MuCj4gCj4gCj4gSSdtIHNlbmRpbmcgeW91IGFuIGUt
bWFpbCBiZWNhdXNlIEkgaGF2ZSBhbiBpbnF1aXJ5IGFib3V0IHRoZSBmMmZzIGNvbW1pdCBiZWxv
dy4KPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwNTIz
MTMyOTQ4LjIyNTAyNTQtMS1jaGFvQGtlcm5lbC5vcmcvI1IgPGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDA1MjMxMzI5NDguMjI1MDI1NC0xLWNoYW9Aa2VybmVs
Lm9yZy8jUj4KPiAKPiAKPiAgRnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UsIGl0IHNlZW1zIHRvIGJl
IGEgbW9kaWZpY2F0aW9uIHRvIGZpeCByYWNlIGNhc2UgSU9NQVBfSE9MRShhbGwgemVybykgdXNp
bmcgZGlyZWN0IGlvLgo+IAo+IEhvd2V2ZXIsIGluIHRoZSB2Ni42LWtlcm5lbCB0aGF0IGluY2x1
ZGVzIHRoaXMgY29tbWl0LCB0aGUgZmlvIHNlcXVlbnRpYWwgd3JpdGUgcGVyZm9ybWFuY2UgaXMg
dmVyeSBsb3cuCj4gCj4g4oCLKHY2LjEta2VybmVsKSBhYm91dCAzOTAwTUIvcyBvciBtb3JlCj4g
Cj4gKHY2LjYta2VybmVsKSBhYm91dCA4MDBNQi9zIG9yIGxlc3MKPiAKPiAKPiBEdWUgdG8gdGhl
IGNvcnJlc3BvbmRpbmcgY29tbWl0LCAiZjJmc19idWZmZXJlZF93cml0ZV9pdGVyIiBpcyBiZWlu
ZyBwZXJmb3JtZWQgaW5zdGVhZCBvZiAiZjJmc19kaW9fd3JpdGVfaXRlciIuIChSZWQgYm94IHBh
cnQgb2YgcGVyZiBjYWxsIHN0YWNrIGJlbG93KQo+IAo+IEkgd29uZGVyIGlmIHlvdSBrbm93IGFi
b3V0IHRoaXMgcGFydCBhbmQgaWYgdGhlcmUgaXMgYW55IHdheSB0byBtb2RpZnkgSU9NQVBfSE9M
RSBzbyBhcyBub3QgdG8gYWZmZWN0IHRoZSBwZXJmb3JtYW5jZSBvZiBkaXJlY3QgaW8uCj4gCj4g
Cj4+IHBlcmYgZGF0YSBkdXJpbmcgZmlvIHRlc3QgKHY2LjYga2VybmVsIHdpdGggeW91ciBjb21t
aXQpCj4gCj4gZmlvIERJTyBzZXF1ZW50aWFsIHdyaXRlIDgwME1CL3MgKHZlcnkgc2xvdykKPiAK
PiBUaGUgcGFydCBvZiB0aGUgcmVkIGJveCBiZWxvdyBpcyBhbiBhY3Rpb24gdGhhdCBkaWQgbm90
IGV4aXN0IGluIHRoZSBwcmV2aW91cyBrZXJuZWwgYW5kIGlzIGJlY29taW5nIGEgZmFjdG9yIHRo
YXQgcmVkdWNlcyBESU8gc2VxIHdyaXRlIHBlcmZvcm1hbmNlLgo+IAo+IEluIHRoaXMgY2FzZSwg
ImYyZnNfZmlsZV93cml0ZV9pdGVyIiB0YWtlcyBtdWNoIGxvbmdlciB0aGFuIHRoZSBwcmV2aW91
cyBrZXJuZWwuCj4gCj4gCj4+IHBlcmYgZGF0YSBkdXJpbmcgZmlvIHRlc3QgKHY2LjEga2VybmVs
KQo+IAo+IGZpbyBESU8gc2VxdWVudGlhbCB3cml0ZSAzOTAwTUIvcwo+IAo+IFRoZXJlIGlzIG5v
IGNhbGwgZm9yIHRoZSAiZjJmc19idWZmZXJlZF93cml0ZV9pdGVyIiBvciAiZ2VuZXJpY19wZXJm
b3JtX3dyaXRlIiBmdW5jdGlvbiBhbmQgImYyZjJfZmlsZV93cml0ZV9pdGVyIiBtb3JlIGZhc3Qg
YW5kIHRoZXJlIGlzIG5vIHByb2JsZW0gd2l0aCBESU8gc2VxIHdyaXRlIHBlcmZvcm1hbmNlLgo+
IAo+IOKAiwo+IAo+IFRoYW5rIHlvdQo+IAo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
