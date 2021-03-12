Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2DC339035
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 15:42:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKizs-0003XZ-69; Fri, 12 Mar 2021 14:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lKizq-0003XR-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ZgtvRUCOeB2tes232V28vaR4drPg6AkuyiMBwt7N/Q=; b=IK1MdVHDC4yTr+sHktZbzbFK7f
 1Vjxd4Ad0YUgUSzFcUsNMFFGjjmSbgnRMFOYclpNS/TL/w8xk342vydxvP3FW7N6xAyH2+5q90oyV
 RltJ2mVv2dWU0yThyDVH0BgRRnAIRl/pJ/Jz9yQCaX2Iu3brJeb12BmAGmD4YXR2mTEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ZgtvRUCOeB2tes232V28vaR4drPg6AkuyiMBwt7N/Q=; b=Ub7HpKISh/z/AjA46xqIXy4Xxq
 E3weo2qHJqpU16FCjaZs2cxvIpd5c1ySc2Jms2Fau/HirwZi/OcYOiQn0hgg4PIdd6WSfq+DaTCo6
 ox7qy/DYhamgXTdLjgfqQ5cp8KXpECJ5mXCszSskSnzimU2cG8YHIfkRCymuRkWcVQ8s=;
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lKize-005sUe-Da
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:42:34 +0000
Received: by mail-lj1-f177.google.com with SMTP id u20so7043624lja.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Mar 2021 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ZgtvRUCOeB2tes232V28vaR4drPg6AkuyiMBwt7N/Q=;
 b=TT4sNAbE++eXFwV/kLG3OLxZb9hyTRXOGfbo6NPgoa2hdLLMENGShbvPYOMDArP8C5
 RKlPk5VVpXNLF5blZeOdwAjGPqVXpFNPgjYYrVb6O7GTSkRB+Fyx4O0pa1l1kOsnNznE
 xFQvIUZJl9uQGXJCjQKizXLGUUTlD0HXVt/Jj+aRfi07o21cJzRKvEb8KZXWulKHg8zG
 cYjle+Zze0D4cKdNB230Q6aco2pQXDIaERXcL6iiXjVMaecRViWLROHlXHGW5L3Y96Iw
 lxE1WH3xyR63B64hekFbsHI2M4laMPJAcwNUXM8c15Kdw4Xwvmqb+4R3WaP2XCRHxlrc
 GyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ZgtvRUCOeB2tes232V28vaR4drPg6AkuyiMBwt7N/Q=;
 b=LLh+CtNQcbG3kc3Fk53tmrUWUETiBNWZ6qBISLu9znu3/7ER+95m1oj7DSKfVpAguh
 o2oUGxiQAlmr8pvIKej0hfX4Uo+J5gjmUn5tO+rVy171mKBnj6EVjRoBRepPUBCYbg6s
 dSRH9utzXtWqT+FEgrkH4CySyay5bNAEb9i9gTeG4LsSK2OAYEWfXeEdSK58PXiVZVZy
 YEv7kjXp2ITnGhEKF4hFaEVqTn91ZZ2D8DEZI85mulUn3PSlLKz4KAYpWrYWwpUnJYDF
 PeM7aRk4fY3hSRqtSOaSqtJLlXhZ6DMQjmdQ/bLZMM8aDbV0qnHXI2EvpweqxjjTAkJd
 UfwQ==
X-Gm-Message-State: AOAM533qFUnAwmQpj5EIGbx4KM1kIrrJ2Hcis374U7DBoR9FlwZJhvsL
 qIR1LUhjBW0r9R4IbnbctFnkoj5zN7UZsOm/KSs=
X-Google-Smtp-Source: ABdhPJyYrWIGZUKMt0BSk3MntCjtvxsWjGr/pshTWbxymBr5n5Yeb0oG2eoConQ8JmoQLge5D2qeM72hwKUHisAYu+8=
X-Received: by 2002:a2e:b606:: with SMTP id r6mr2573928ljn.327.1615560135802; 
 Fri, 12 Mar 2021 06:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20210312122531.2717093-1-daeho43@gmail.com>
 <YEtg8U7whCVV2tQt@kroah.com>
 <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
 <YEt00vJ6oVfoRjSJ@kroah.com>
 <CACOAw_yjyy+58B=RawAaQO98NQB43roZOv4sq5313sFHN1myXQ@mail.gmail.com>
In-Reply-To: <CACOAw_yjyy+58B=RawAaQO98NQB43roZOv4sq5313sFHN1myXQ@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Mar 2021 23:42:04 +0900
Message-ID: <CACOAw_wipL_SHyKp+56SOx99LnBZsrWq2eRmLm7Bz16jEYM8zg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.177 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lKize-005sUe-Da
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add sysfs nodes to get runtime
 compression stat
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U28sIGRvIHlvdSB3YW50IHdlIHByb3RlY3QgdGhlIHZhbHVlcyBoZXJlIHdpdGggc3Bpbl9sb2Nr
IGFuZCBqdXN0CnJlYWQgd2l0aG91dCBzcGluX2xvY2sgaW4gc3lzZnMgcmVhZCBwYXJ0PwoKMjAy
MeuFhCAz7JuUIDEy7J28ICjquIgpIOyYpO2bhCAxMTozNywgRGFlaG8gSmVvbmcgPGRhZWhvNDNA
Z21haWwuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBBcyB5b3UgY2FuIHNlZSwgaWYgd2UncmUgZG9p
bmcgbGlrZSB0aGUgYmVsb3cuCj4KPiBzYmktPmNvbXByX3dyaXR0ZW5fYmxvY2sgKz0gYmxvY2tz
Owo+Cj4gTGV0J3MgYXNzdW1lIHRoZSBpbml0aWFsIHZhbHVlIGFzIDAuCj4KPiA8dGhyZWFkIEE+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRocmVhZCBCPgo+
IHNiaS0+Y29tcHJfd3JpdHRlbl9ibG9jayA9IDA7Cj4KPiBzYmktPmNvbXByX3dyaXR0ZW5fYmxv
Y2sgPSAwOwo+ICtibG9ja3MoMyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKyBibG9ja3MoMik7Cj4gc2JpLT5jb21wcl93
cml0dGVuX2Jsb2NrID0gMzsKPgo+IHNiaS0+Y29tcHJfd3JpdHRlbl9ibG9jayA9IDI7Cj4KPiBG
aW5hbGx5LCB3ZSBlbmQgdXAgd2l0aCAyLCBub3QgNS4KPgo+IEFzIG1vcmUgdGhyZWFkcyBhcmUg
cGFydGljaXBhdGluZyBpdCwgd2UgbWlnaHQgbWlzcyBtb3JlIGNvdW50aW5nLgo+Cj4gMjAyMeuF
hCAz7JuUIDEy7J28ICjquIgpIOyYpO2bhCAxMTowNCwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+64uY7J20IOyekeyEsToKPiA+Cj4gPiBPbiBGcmksIE1hciAxMiwgMjAyMSBh
dCAxMDo1NjoxM1BNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+ID4gVGhhbmtzIGZvciBz
dWdnZXN0aW5nIG1lIHN5c2ZzX2VtaXQoKS4KPiA+ID4KPiA+ID4gRm9yIGF0b21pYyB2YWx1ZXMs
IGFjdHVhbGx5LCB0aG9zZSBhcmUgbmVlZGVkIGZvciB3cml0ZXIgcGFydCwgbm90IHJlYWRlci4K
PiA+ID4KPiA+ID4gKyNkZWZpbmUgYWRkX2NvbXByX2Jsb2NrX3N0YXQoaW5vZGUsIGJsb2Nrcykg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgICAgIGRvIHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+
ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5v
ZGUpOyAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgIGludCBkaWZmID0gRjJGU19J
KGlub2RlKS0+aV9jbHVzdGVyX3NpemUgLSBibG9ja3M7ICAgICAgXAo+ID4gPiArICAgICAgICAg
ICAgICAgYXRvbWljNjRfYWRkKGJsb2NrcywgJnNiaS0+Y29tcHJfd3JpdHRlbl9ibG9jayk7ICAg
ICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICBhdG9taWM2NF9hZGQoZGlmZiwgJnNiaS0+Y29t
cHJfc2F2ZWRfYmxvY2spOyAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICB9IHdoaWxlICgwKQo+
ID4gPgo+ID4gPiBJIG5lZWRlZCBhIHByb3RlY3Rpb24gaGVyZSwgYmVjYXVzZSB0aGV5IG1pZ2h0
IGJlIHVwZGF0ZWQgaW4gdGhlIHJhY2UgY29uZGl0aW9uLgo+ID4KPiA+IFdoeT8gIFdoYXQgYXJl
IHlvdSB0cnlpbmcgdG8gcHJvdGVjdCBmcm9tICJyYWNpbmciIGhlcmU/Cj4gPgo+ID4gdGhhbmtz
LAo+ID4KPiA+IGdyZWcgay1oCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
