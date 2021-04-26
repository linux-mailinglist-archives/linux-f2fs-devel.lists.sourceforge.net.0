Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E50636B01E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Apr 2021 11:00:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lax6p-0006jF-Df; Mon, 26 Apr 2021 09:00:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <hsiangkao@redhat.com>) id 1lax6n-0006j7-NH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 09:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DSVkH87Qex0htsJSNfwCIC5UM16KZ2T9tXbF0mW7eQE=; b=k+atglgisT5gAKF+6J6nYCtSA3
 Tq5CIbuDG/zeplPxGznu/LnKFAgrquoW71p1PvuDh/yLNEKBiNFYFkF/+2gipVFfCH2vV5vQc1QsA
 8iEiXbYWSOEFAMOjgfXymk1GtqT961u67jzNFUHubAdyzt5yDM6v8aOsV0iiQxJphI9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DSVkH87Qex0htsJSNfwCIC5UM16KZ2T9tXbF0mW7eQE=; b=dz1dhCi/piUDNdmcIQa4dsrE8p
 zRxZxYWQ4ggr0NQV4Ve35jG3Nq9auYnYVUgIViEgVc8+lq1Tzdr6gPD+phuGSiM6+NrnWVkdGSgid
 SexTxEzZBr1TxQUBdiqjGLKGEv63jMvt9Rzh7avL4fMrGAf2jRgH+56I9X1sScqI0Vns=;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lax6i-0000iI-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 09:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619427638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSVkH87Qex0htsJSNfwCIC5UM16KZ2T9tXbF0mW7eQE=;
 b=bLrVlMW1nZjmZIeRHfffk7iaRK+ZbFUlS7dvqQQeDpdSV7TKAGynEEfVwmCQFwLYXCRNyr
 ErR3e3B+ZZamH4YEhVOY6S+hjLf5RP5qAFC7Eg5FfexY88gIhiosW0gkHFUFnRmGlgUbjB
 fMyNy/tN95BmVc2eO+8tgQXl+RRXFuI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-l8xcbk5bMMii5rKi60zpnQ-1; Mon, 26 Apr 2021 05:00:36 -0400
X-MC-Unique: l8xcbk5bMMii5rKi60zpnQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 9-20020a056a000729b029025d0d3c2062so14006228pfm.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Apr 2021 02:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=DSVkH87Qex0htsJSNfwCIC5UM16KZ2T9tXbF0mW7eQE=;
 b=fX4ctlBOUHTfXeQDhuKXZSLKfXvCrnGMg0S2vsH6ud0TtJT2IOCJmLdQ34bOpVW2rc
 SHVbk/lztvFSPxwLc7oiFu8Wd6kDIu0yxecCjK3s1cccCpYntZijSvXewW3fNH7fjcQF
 F9k5MHysWbthjPmM0/QEe09kNt67t2RtfKAFFs7mA75bodIK0K7l7ToM+M562G22pcfV
 PVDvKlOk9SC2PUg45EhqfvZXUFyTZk+von94nahuFUa0Znv/fPjMOyK+1NocWImhgZEt
 SVE5mZiSISt5pz6GieJVm9VBfdIDIhTypAE+Ab8OMppZE5MNt2ZA67ZsIwOwcxInPkgd
 43HQ==
X-Gm-Message-State: AOAM532LCMgQzvyD6bCNga7ECqMgo33HjoREx3IGszBKiKoP1g7f0xAh
 lkkGSmjZnAD+vRA/rv3/WFZ1ml33sVlqmTbbMnTbFSw2c6NbkbubykiT+gVmhC9rC0y7yR9C9tr
 xcOm0vcT7mB3B67+GxzVVrqJSz9BF1kz8Rtaowg==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr15960161pgh.255.1619427635378; 
 Mon, 26 Apr 2021 02:00:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBG32Ha4pbJUPPf1CorqHg5lQ+rPxriox9WH9s8iIh2NMX6eXgQBTD+X3klmz/e54aovpajQ==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr15960142pgh.255.1619427635072; 
 Mon, 26 Apr 2021 02:00:35 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id pc17sm11714796pjb.19.2021.04.26.02.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 02:00:34 -0700 (PDT)
Date: Mon, 26 Apr 2021 17:00:24 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: changfengnan@vivo.com
Message-ID: <20210426090024.GB4042836@xiangao.remote.csb>
References: <20210426021153.646-1-changfengnan@vivo.com>
 <20210426031902.GA3934275@xiangao.remote.csb>
 <004c01d73a78$12f23a30$38d6ae90$@vivo.com>
MIME-Version: 1.0
In-Reply-To: <004c01d73a78$12f23a30$38d6ae90$@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [216.205.24.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lax6i-0000iI-GQ
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiAgW1BBVENIXSBmMmZzOiBjb21wcmVz?=
 =?utf-8?q?s=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fove?=
 =?utf-8?q?rwrite?=
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

T24gTW9uLCBBcHIgMjYsIDIwMjEgYXQgMDQ6NDI6MjBQTSArMDgwMCwgY2hhbmdmZW5nbmFuQHZp
dm8uY29tIHdyb3RlOgo+IFRoYW5rIHlvdSBmb3IgdGhlIHJlbWluZGVyLCBJIGhhZG4ndCB0aG91
Z2h0IGFib3V0IGZhbGxvY2F0ZSBiZWZvcmUuCj4gSSBoYXZlIGRvbmUgc29tZSB0ZXN0cyBhbmQg
dGhlIHJlc3VsdHMgYXJlIGFzIGV4cGVjdGVkLgo+IEhlcmUgaXMgbXkgdGVzdCBtZXRob2QsIGNy
ZWF0ZSBhIGNvbXByZXNzZWQgZmlsZSwgYW5kIHVzZSBmYWxsb2NhdGUgd2l0aCBrZWVwIHNpemUs
IHdoZW4gd3JpdGUgZGF0YSB0byBleHBhbmQgYXJlYSwgZjJmc19wcmVwYXJlX2NvbXByZXNzX292
ZXJ3cml0ZQo+IGFsd2F5cyByZXR1cm4gMCwgdGhlIGJlaGF2aW9yIGlzIHNhbWUgYXMgbXkgcGF0
Y2ggLCBhcHBseSBteSBwYXRjaCBjYW4gYXZvaWQgdGhvc2UgY2hlY2suCj4gSXMgdGhlcmUgYW55
dGhpbmcgZWxzZSBJIGhhdmVuJ3QgdGhvdWdodCBvZj8KCk5vcGUsIEkgZGlkbid0IGxvb2sgaW50
byB0aGUgaW1wbGVtZW50YXRpb24uIEp1c3QgYSB3aWxkIGd1ZXNzLgoKKEkganVzdCB3b25kZXJl
ZCBpZiB0aGUgY2x1c3RlciBzaXplIGlzIHNvbWV3aGF0IGxhcmdlIChlLmcuIDY0ayksCiBidXQg
d2l0aCBhIHBhcnRpYWwgZmFsbG9jYXRlIChlLmcuIDE2ayksIGFuZCBkb2VzIGl0IGJlaGF2ZSBv
az8KIG9yIHNvbWUgb3RoZXIgY29ybmVyIGNhc2VzL2NvbmRpdGlvbnMgYXJlIG5lZWRlZC4pCgpJ
ZiB0aGF0IGlzIGZpbmUsIEkgaGF2ZSBubyBwcm9ibGVtIGFib3V0IHRoaXMsIHlldCBpX3NpemUg
aGVyZQppcyBnZW5lcmFsbHkgc29tZXdoYXQgcmlza3kgc2luY2UgYWZ0ZXIgcG9zdC1FT0YgYmVo
YXZpb3IKY2hhbmdlcyAoZS5nLiBzdXBwb3J0aW5nIEZBTExPQ19GTF9aRVJPX1JBTkdFIHdpdGgg
a2VlcCBzaXplCmxhdGVyKSwgaXQgbWF5IGNhdXNlIHNvbWUgcG90ZW50aWFsIHJlZ3Jlc3Npb24u
Cgo+IAo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IEdhbyBYaWFuZyA8aHNp
YW5na2FvQHJlZGhhdC5jb20+Cj4g5Y+R6YCB5pe26Ze0OiAyMDIx5bm0NOaciDI25pelIDExOjE5
Cj4g5pS25Lu25Lq6OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4g5oqE
6YCBOiBjaGFvQGtlcm5lbC5vcmc7IGphZWdldWtAa2VybmVsLm9yZzsKPiBsaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IOS4u+mimDogUmU6IFtmMmZzLWRldl0gW1BBVENI
XSBmMmZzOiBjb21wcmVzczogYXZvaWQgdW5uZWNlc3NhcnkgY2hlY2sgaW4KPiBmMmZzX3ByZXBh
cmVfY29tcHJlc3Nfb3ZlcndyaXRlCj4gCj4gT24gTW9uLCBBcHIgMjYsIDIwMjEgYXQgMTA6MTE6
NTNBTSArMDgwMCwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPiA+IHdoZW4gd3JpdGUgY29tcHJlc3Nl
ZCBmaWxlIHdpdGggT19UUlVOQywgdGhlcmUgd2lsbCBiZSBhIGxvdCBvZgo+ID4gdW5uZWNlc3Nh
cnkgY2hlY2sgdmFsaWQgYmxvY2tzIGluIGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUs
Cj4gPiBlc3BlY2lhbGx5IHdoZW4gd3JpdHRlbiBpbiBwYWdlIHNpemUsIHJlbW92ZSBpdC4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+
Cj4gCj4gRXZlbiB0aG91Z2ggSSBkaWRuJ3QgbG9vayBpbnRvIHRoZSB3aG9sZSB0aGluZywgbXkg
cmVhY3Rpb24gaGVyZSBpcyByb3VnaGx5Cj4gaG93IHRvIGhhbmRsZSBmYWxsb2NhdGUgd2l0aCBr
ZWVwIHNpemU/IERvZXMgaXQgd29yayBhcyBleHBlY3RlZD8KPiAKPiA+IC0tLQo+ID4gIGZzL2Yy
ZnMvZGF0YS5jIHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4
Cj4gPiBjZjkzNTQ3NGZmYmEuLjljM2IwODQ5ZjM1ZSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4gQEAgLTMyNzAsNiArMzI3MCw3IEBA
IHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwKPiA+IHN0cnVj
dCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ID4gIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkg
PSBGMkZTX0lfU0IoaW5vZGUpOwo+ID4gIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7Cj4gPiAg
CXBnb2ZmX3QgaW5kZXggPSAoKHVuc2lnbmVkIGxvbmcgbG9uZykgcG9zKSA+PiBQQUdFX1NISUZU
Owo+ID4gKwlwZ29mZl90IGVuZCA9IChpX3NpemVfcmVhZChpbm9kZSkgKyBQQUdFX1NJWkUgLSAx
KSA+PiBQQUdFX1NISUZUOwo+ID4gIAlib29sIG5lZWRfYmFsYW5jZSA9IGZhbHNlLCBkcm9wX2F0
b21pYyA9IGZhbHNlOwo+ID4gIAlibG9ja190IGJsa2FkZHIgPSBOVUxMX0FERFI7Cj4gPiAgCWlu
dCBlcnIgPSAwOwo+ID4gQEAgLTMzMDYsNiArMzMwNyw5IEBAIHN0YXRpYyBpbnQgZjJmc193cml0
ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwKPiA+IHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBw
aW5nLAo+ID4KPiA+ICAJCSpmc2RhdGEgPSBOVUxMOwo+ID4KPiA+ICsJCWlmIChpbmRleCA+PSBl
bmQpCj4gPiArCQkJZ290byByZXBlYXQ7Cj4gPiArCj4gPiAgCQlyZXQgPSBmMmZzX3ByZXBhcmVf
Y29tcHJlc3Nfb3ZlcndyaXRlKGlub2RlLCBwYWdlcCwKPiA+ICAJCQkJCQkJaW5kZXgsIGZzZGF0
YSk7Cj4gPiAgCQlpZiAocmV0IDwgMCkgewo+ID4gLS0KPiA+IDIuMjkuMAo+IAo+IAo+IAo+IAo+
IAo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
