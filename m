Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1957236AFE1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Apr 2021 10:42:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lawp9-0007Ij-WD; Mon, 26 Apr 2021 08:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lawp8-0007ID-F0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 08:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ru/Bl9V8Sjs/fDbYi/60ptPv2iak/FPV1pnqt6lx+qA=; b=LFSUAOupeAZBqJiUZuVl9sE77P
 b8z3GBruFaXWf0JekVJe8Qzw2nfncbRvMTF9Ui3BCIEzBmZatkEptTxhWPricmZ7QhU+JORMGY05V
 BelOQHc8BDuWZfdqcSNuW1gD/Mr2EZfLRHgaWL2HjOC6HTj7k5LjOpnCIfu/ZUbTnIcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ru/Bl9V8Sjs/fDbYi/60ptPv2iak/FPV1pnqt6lx+qA=; b=KuY6G/n5/UwlKv3kP4gHB05uHR
 OJanCckW7SWhh5zcbP4a05Zq2+Pwy6xI1eHE1otMGKSkRnsyxj+kOS8VNRlGsxOcGXsPnnzijMjpn
 neoa85TL/iWQR3SVqANDHKrfBtyvX6xS7CGcbL6Uc/NZswTYpflJhYCc1/momqqIFwsk=;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lawp2-0007ub-RK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 08:42:34 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id ABF80540494;
 Mon, 26 Apr 2021 16:42:21 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Gao Xiang'" <hsiangkao@redhat.com>
References: <20210426021153.646-1-changfengnan@vivo.com>
 <20210426031902.GA3934275@xiangao.remote.csb>
In-Reply-To: <20210426031902.GA3934275@xiangao.remote.csb>
Date: Mon, 26 Apr 2021 16:42:20 +0800
Message-ID: <004c01d73a78$12f23a30$38d6ae90$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEDaFQ4pZvVc1HwAGtcmyMJeZE9VAD+gnKKAlNHH18=
Content-Language: zh-cn
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGkpITFZPSEpMSUMaQh5JHhhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDI6Hww5Kj8NGgEQGSkQAVZW
 DDcwFCpVSlVKTUpCT0lNTk9JSU1OVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBSENPSDcG
X-HM-Tid: 0a790d580125d995kuwsabf80540494
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [59.111.176.40 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.40 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lawp2-0007ub-RK
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiAgW1BBVENIXSBmMmZzOiBjb21wcmVzczog?=
	=?utf-8?q?avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fo?=
	=?utf-8?q?verwrite?=
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhhbmsgeW91IGZvciB0aGUgcmVtaW5kZXIsIEkgaGFkbid0IHRob3VnaHQgYWJvdXQgZmFsbG9j
YXRlIGJlZm9yZS4KSSBoYXZlIGRvbmUgc29tZSB0ZXN0cyBhbmQgdGhlIHJlc3VsdHMgYXJlIGFz
IGV4cGVjdGVkLgpIZXJlIGlzIG15IHRlc3QgbWV0aG9kLCBjcmVhdGUgYSBjb21wcmVzc2VkIGZp
bGUsIGFuZCB1c2UgZmFsbG9jYXRlIHdpdGgga2VlcCBzaXplLCB3aGVuIHdyaXRlIGRhdGEgdG8g
ZXhwYW5kIGFyZWEsIGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUKYWx3YXlzIHJldHVy
biAwLCB0aGUgYmVoYXZpb3IgaXMgc2FtZSBhcyBteSBwYXRjaCAsIGFwcGx5IG15IHBhdGNoIGNh
biBhdm9pZCB0aG9zZSBjaGVjay4KSXMgdGhlcmUgYW55dGhpbmcgZWxzZSBJIGhhdmVuJ3QgdGhv
dWdodCBvZj8KCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0K5Y+R5Lu25Lq6OiBHYW8gWGlhbmcgPGhz
aWFuZ2thb0ByZWRoYXQuY29tPgrlj5HpgIHml7bpl7Q6IDIwMjHlubQ05pyIMjbml6UgMTE6MTkK
5pS25Lu25Lq6OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+CuaKhOmAgTog
Y2hhb0BrZXJuZWwub3JnOyBqYWVnZXVrQGtlcm5lbC5vcmc7CmxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0CuS4u+mimDogUmU6IFtmMmZzLWRldl0gW1BBVENIXSBmMmZzOiBj
b21wcmVzczogYXZvaWQgdW5uZWNlc3NhcnkgY2hlY2sgaW4KZjJmc19wcmVwYXJlX2NvbXByZXNz
X292ZXJ3cml0ZQoKT24gTW9uLCBBcHIgMjYsIDIwMjEgYXQgMTA6MTE6NTNBTSArMDgwMCwgRmVu
Z25hbiBDaGFuZyB3cm90ZToKPiB3aGVuIHdyaXRlIGNvbXByZXNzZWQgZmlsZSB3aXRoIE9fVFJV
TkMsIHRoZXJlIHdpbGwgYmUgYSBsb3Qgb2YKPiB1bm5lY2Vzc2FyeSBjaGVjayB2YWxpZCBibG9j
a3MgaW4gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSwKPiBlc3BlY2lhbGx5IHdoZW4g
d3JpdHRlbiBpbiBwYWdlIHNpemUsIHJlbW92ZSBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEZlbmdu
YW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KCkV2ZW4gdGhvdWdoIEkgZGlkbid0IGxv
b2sgaW50byB0aGUgd2hvbGUgdGhpbmcsIG15IHJlYWN0aW9uIGhlcmUgaXMgcm91Z2hseQpob3cg
dG8gaGFuZGxlIGZhbGxvY2F0ZSB3aXRoIGtlZXAgc2l6ZT8gRG9lcyBpdCB3b3JrIGFzIGV4cGVj
dGVkPwoKPiAtLS0KPiAgZnMvZjJmcy9kYXRhLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJm
cy9kYXRhLmMgaW5kZXgKPiBjZjkzNTQ3NGZmYmEuLjljM2IwODQ5ZjM1ZSAxMDA2NDQKPiAtLS0g
YS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gQEAgLTMyNzAsNiArMzI3
MCw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwKPiBz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4gIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7Cj4gIAlw
Z29mZl90IGluZGV4ID0gKCh1bnNpZ25lZCBsb25nIGxvbmcpIHBvcykgPj4gUEFHRV9TSElGVDsK
PiArCXBnb2ZmX3QgZW5kID0gKGlfc2l6ZV9yZWFkKGlub2RlKSArIFBBR0VfU0laRSAtIDEpID4+
IFBBR0VfU0hJRlQ7Cj4gIAlib29sIG5lZWRfYmFsYW5jZSA9IGZhbHNlLCBkcm9wX2F0b21pYyA9
IGZhbHNlOwo+ICAJYmxvY2tfdCBibGthZGRyID0gTlVMTF9BRERSOwo+ICAJaW50IGVyciA9IDA7
Cj4gQEAgLTMzMDYsNiArMzMwNyw5IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1
Y3QgZmlsZSAqZmlsZSwKPiBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPgo+ICAJCSpm
c2RhdGEgPSBOVUxMOwo+Cj4gKwkJaWYgKGluZGV4ID49IGVuZCkKPiArCQkJZ290byByZXBlYXQ7
Cj4gKwo+ICAJCXJldCA9IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUoaW5vZGUsIHBh
Z2VwLAo+ICAJCQkJCQkJaW5kZXgsIGZzZGF0YSk7Cj4gIAkJaWYgKHJldCA8IDApIHsKPiAtLQo+
IDIuMjkuMAoKCgoKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
