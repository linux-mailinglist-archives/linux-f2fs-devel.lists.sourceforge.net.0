Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50388429B58
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Oct 2021 04:17:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ma7Lj-00077F-HG; Tue, 12 Oct 2021 02:17:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keosung.park@samsung.com>) id 1ma7Li-000775-LE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Oct 2021 02:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bjF8GfGDktGMGST+t3Qhy6O/bl7MPaWqkwBXBE1Yksw=; b=O/tYuszrEp1MJD38HW60+IkZ+V
 0aM8v55+OSfNtYOeVZV0Os1lK4FMhMhhD/ilIi0cg8p3S3/9NjUdm9R8/sRz6hZCm7CGv8flCIcs+
 s0lKVwiJPncP2Tb517ppdsLroYUTYPaxbhQ0za88Nq22TLFmbg9+7D6MRCsfgnk+oOfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bjF8GfGDktGMGST+t3Qhy6O/bl7MPaWqkwBXBE1Yksw=; b=Vle+uFdXx3H/0CkviQyCP9uRVF
 kTgBnFShUioOrg1vVZIdR9PLbsD0t2are47beeNdSpzI0GD7OOHWYwgSfqA3v8+McHmz4I6caA/Rx
 Ifq9PyeA4KLkwGj9EvfrFOtnsyaoJWPuSGjTKawH72yfMEcFUgvp95Kkow1G//h9cVgI=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ma7Ld-0002zX-5j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Oct 2021 02:17:02 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20211012021646epoutp01d3ad7ecfde2437434d1672a96a64c86f~tJuViMH9F2530525305epoutp01Y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Oct 2021 02:16:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20211012021646epoutp01d3ad7ecfde2437434d1672a96a64c86f~tJuViMH9F2530525305epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1634005006;
 bh=bjF8GfGDktGMGST+t3Qhy6O/bl7MPaWqkwBXBE1Yksw=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=EPRKeOK+rvppe4kJoP6Cp5AB4XgPzU6IE0SMLcaBAwXVq3ww1JV2GrPoRqQhNbQ4/
 I3p4i51AWwqNpOdQakTndHF95kaQ+wF3uSS9gfrLzA4XoNACW05mebA7wXHZWq+noy
 i6biMoInopQnvvCDbjP+YKi5L1iRsl20ULQJ/yTk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20211012021645epcas2p204cc2e5e077dfdb931a1eebb6044a885~tJuU8hu2Z1895118951epcas2p22;
 Tue, 12 Oct 2021 02:16:45 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4HSzn40DBZz4xBKn; Tue, 12 Oct
 2021 02:16:40 +0000 (GMT)
X-AuditID: b6c32a48-d75ff70000002500-c9-6164f006ef8d
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 4E.E7.09472.600F4616; Tue, 12 Oct 2021 11:16:39 +0900 (KST)
Mime-Version: 1.0
From: Keoseong Park <keosung.park@samsung.com>
To: Chao Yu <chao@kernel.org>, Keoseong Park <keosung.park@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <a59baec0-02cf-28d6-17cd-3ff6dfdf0a01@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20211012021638epcms2p88d9f7abf1abe4ddb29d314d950b537cb@epcms2p8>
Date: Tue, 12 Oct 2021 11:16:38 +0900
X-CMS-MailID: 20211012021638epcms2p88d9f7abf1abe4ddb29d314d950b537cb
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmhS77h5REg3/nGC3W9O1isjg99SyT
 xctDmharHoRb9PZvZbN4sn4Ws8Xxk+8YLS4tcre4vGsOm0Xn9DUsFnOOdrI7cHtsWtXJ5rF7
 wWcmj74tqxg9Pm+S89jwqYM5gDUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJc
 SSEvMTfVVsnFJ0DXLTMH6C4lhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5x
 Ym5xaV66Xl5qiZWhgYGRKVBhQnbGotO9TAWrWCtm3lzI1sC4nqWLkZNDQsBE4srTP2xdjFwc
 QgI7GCWuzjnB2MXIwcErICjxd4cwSI2wgLnEx7Xn2UBsIQElia6FW5kh4gYS66bvAbPZBPQk
 pvy+wwhiiwiUSJzfe5gdZCazwDcmiW9PH7JBLOOVmNH+FGqxtMT25VvBGjgF7CQerNnIBBHX
 kPixrJcZwhaVuLn6LTuM/f7YfEYIW0Si9d5ZqBpBiQc/d4PdLCEgKXHmsCtEuFxi4fllYDdI
 CHQwSrz+vgBqjr7EtY6NYDfwCvhKfH7UzQTSyyKgKnHzrCpEiYvE7dfdYOcwC8hLbH87hxmk
 hFlAU2L9Ln2ITcoSR26xwDzVsPE3OzqbWYBPouPwX7j4jnlPoB5Uk3i0YAvrBEblWYhwnoVk
 1yyEXQsYmVcxiqUWFOempxYbFZjAozY5P3cTIziBannsYJz99oPeIUYmDsZDjBIczEoivG85
 UhKFeFMSK6tSi/Lji0pzUosPMZoCPTmRWUo0OR+YwvNK4g1NLA1MzMwMzY1MDcyVxHnn/nNK
 FBJITyxJzU5NLUgtgulj4uCUamCa9+5aPEvTv6lPH5RufrnGoz3/2Vqmp+tYmNSUdx8RdHi1
 dtNm/kM9NvIVNVp9YU9PKz3a6uqsxcf7K3gx4xf2l4ekN68OfJ1+3mPnWe0buZtVK/Qiog8k
 uiXPfLuw7+Xn+XGz0u+czZuUsFHsBvui/Wd+qiRVv1G486yYNd/hi6p/Vm/QpIJbypE3G7n+
 Nct0xK7Tkk83/eO43fGA0pwnQT/LrQ12uORETtVb/oo7Q7Kix1Qt4bJgwd+o8Bubj0XFK31Y
 fu6km2zbaom387zez7o8O23R1qyZifNuaImH/JsQKCXje2lLT8/pu5FbH+7eviN7rqrVsQ+P
 0hJDv+wTmfLhjWP+0qPqn7QSOJayKbEUZyQaajEXFScCAPZYazopBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210930005939epcms2p7303bf6f96c824720f824989746491cba
References: <a59baec0-02cf-28d6-17cd-3ff6dfdf0a01@kernel.org>
 <20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p7>
 <CGME20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p8>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, >On 2021/9/30 8:59, Keoseong Park wrote: >> Since
 active_logs can be set to 2 or 4 or NR_CURSEG_PERSIST_TYPE(6), >> it cannot
 be set to NR_CURSEG_TYPE(8). >> That is, whint_mode is always off. >> >>
 T [...] Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ma7Ld-0002zX-5j
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to use WHINT_MODE
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
Reply-To: keosung.park@samsung.com
Cc: "changfengnan@vivo.com" <changfengnan@vivo.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tanghuan@vivo.com" <tanghuan@vivo.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

>On 2021/9/30 8:59, Keoseong Park wrote:
>> Since active_logs can be set to 2 or 4 or NR_CURSEG_PERSIST_TYPE(6),
>> it cannot be set to NR_CURSEG_TYPE(8).
>> That is, whint_mode is always off.
>> 
>> Therefore, the condition is changed from NR_CURSEG_TYPE to NR_CURSEG_PERSIST_TYPE.
>> 
>
>Fixes: d0b9e42ab615 (f2fs: introduce inmem curseg)
>
>> Cc: Chao Yu <chao@kernel.org>
>> Reported-by: Huan Tang <tanghuan@vivo.com>
>> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
>> Signed-off-by: Keoseong Park <keosung.park@samsung.com>
>
>Reviewed-by: Chao Yu <chao@kernel.org>

Thank you for your review.

Best Regards,
Keoseong

>
>Thanks,
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
