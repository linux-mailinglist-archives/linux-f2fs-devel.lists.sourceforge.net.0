Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0594FFD27
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 19:54:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nehBk-0005TW-Cb; Wed, 13 Apr 2022 17:53:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nehBj-0005TQ-FA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9guvEiXVWmcqeZLMiuvKFECwn2aS2PH43bZEHuzYCTg=; b=hHKKKppA5OH2/X8cjkjYmPwBiu
 MTjaTYMqlqhZDGbWgCC9tNO55Cpw0Oo5LBilWHqtSNGhg5GqHZL/Npg5qsxTEuf3tHBIn+bzBCj0Q
 Pm4JXO29Ev+YzIhTesq/2KIWS/mtSBNrDQPLOl4Boh+pZHmAIQyhdWjiBBhaOSkpijuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9guvEiXVWmcqeZLMiuvKFECwn2aS2PH43bZEHuzYCTg=; b=cMK0G0/9IhvS0TDiV18F4OQjE+
 doHcDGKF5B8YK8fzkQF3gxGKaqJkxA2cmLDGm9TI9RUrLx4QQ5He8Suh/BkcjopWLqOBxrMxszgqw
 jE9rt6AN/OAtFNLTlXhQuAOFymszi1Um05V/yZSemOhnkSzykj6HjDwho4h7metxdHHg=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nehBg-00FRCs-Mj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:53:56 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220413175344euoutp01f256161d1acf61d9a9aafc2d927876ab~lhjqQPQxL0676106761euoutp01T
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Apr 2022 17:53:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220413175344euoutp01f256161d1acf61d9a9aafc2d927876ab~lhjqQPQxL0676106761euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649872424;
 bh=9guvEiXVWmcqeZLMiuvKFECwn2aS2PH43bZEHuzYCTg=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=WenlztnyZICPoR4SKsfc1b1MpQzTnIQTiXWlMA3cjbXcGK/6YhEHdY/2URv/pWqy7
 hgqOmIcU0xsqq+cXCRx1UE2no0En1wu2Y/Z4f1Hvi1KNmjaPnFdTt5UD/3pJzq4Qtx
 y5NPTwxXSyM7JOTFnKnyEE3YrAiyU+iYGWwui808=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220413175344eucas1p26ad3a790705e4083c18f70fe43f6c784~lhjqH5Nm_1367613676eucas1p2P;
 Wed, 13 Apr 2022 17:53:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BD.DD.10260.82E07526; Wed, 13
 Apr 2022 18:53:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220413175344eucas1p133cc0ea003c315281c761b6367df8b05~lhjp0abzh1166011660eucas1p1b;
 Wed, 13 Apr 2022 17:53:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220413175344eusmtrp21cd2e5a1e4b4625b7d8255350ebfba36~lhjpzqB5q1487114871eusmtrp2K;
 Wed, 13 Apr 2022 17:53:44 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-01-62570e28ab41
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A8.63.09522.72E07526; Wed, 13
 Apr 2022 18:53:43 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220413175343eusmtip2147a1326e259e96749ac8f01a174a5c3~lhjpoXM9W2377723777eusmtip2d;
 Wed, 13 Apr 2022 17:53:43 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.178) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Apr 2022 18:53:38 +0100
Message-ID: <682b76e1-1889-13aa-337e-a383bfda84a3@samsung.com>
Date: Wed, 13 Apr 2022 19:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <Ylb4q4MKk/07Mwne@google.com>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzneV0NvvAkg1m7RS1a278xWTxZP4vZ
 4tIid4sbE54yWqy5+ZTFgdVj56y77B6bVnWyeexe8JnJo/1AN1MASxSXTUpqTmZZapG+XQJX
 xqf595gKDvBU7O5fx9rA+Iuzi5GTQ0LAROLM08uMXYxcHEICKxgltqybxQbhfGGUmLJ5LROE
 85lR4t7qv8wwLac6j7NDJJYzSsx8fRssAVZ17pMbhL2bUWLFluwuRg4OXgE7iXkrfUDCLAKq
 ElffLgIr5xUQlDg58wkLiC0qECHx69YjdpByYYE8iTkTY0DCzALiEreezGcCsUUEVCQOLboM
 tpZZoI9RYvmLCYwg9WwCWhKNnewgNZxA5oNTvYwQvZoSrdt/s0PY8hLb386BOl9Z4seG02wQ
 dq3E2mNnwGZKCLzhkGi8uZEdIuEicejIKagGYYlXx7dAxWUk/u+EOEhCoFri6Y3fzBDNLYwS
 /TvXs4EcJCFgLdF3JgeixlHiyO93jBBhPokbbwUh7uGTmLRtOvMERtVZSCExC8nLs5C8MAvJ
 CwsYWVYxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEJpnT/45/3cG44tVHvUOMTByMhxgl
 OJiVRHj71UOThHhTEiurUovy44tKc1KLDzFKc7AoifMmZ25IFBJITyxJzU5NLUgtgskycXBK
 NTBtdN+99pJOvdcnPhnT91fmXtq24+zpaqtFoad3rq/8+mAWy5Tg89MPeW8KfLO3l/XTkt3Z
 kxedf3fF2f0EH4vJvMd3ju0T9tH59tHQ4o9O9MSM2bKyyU/Zp6y9bqadsd3B4HDXkht/O79c
 02x5qrJ+Q/zCl4vn2Mz7++lERM6XJme9srVvvsSb7/KcMPfopHNL23e2vWmyaT9a/eqbzGPu
 53M9b11xnsG9ddsMlRXb6588vHl9rqn2n8MGP8ou22y6//hI4/owI6XQgJvZR6xdeOpWTztW
 t3Lx5LQvv8KfLm67o/hLsm41+2nrwxbm1qqb7LfwcTqx3GW+pN3yLMPdnHHKxbkHe0/OU1bh
 k+C9frNDiaU4I9FQi7moOBEA4OybP6EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7oafOFJBjt1LFrbvzFZPFk/i9ni
 0iJ3ixsTnjJarLn5lMWB1WPnrLvsHptWdbJ57F7wmcmj/UA3UwBLlJ5NUX5pSapCRn5xia1S
 tKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7Gp/n3mAoO8FTs7l/H2sD4i7OL
 kZNDQsBE4lTncfYuRi4OIYGljBJNm8+yQiRkJD5d+cgOYQtL/LnWxQZR9JFRonXaQbAiIYHd
 jBLrV+V3MXJw8ArYScxb6QMSZhFQlbj6dhEziM0rIChxcuYTFhBbVCBCYtmuqWC2sECexO4J
 m5hAbGYBcYlbT+aD2SICKhKHFl0GO4hZoI9RYvmLCYwQixuYJPqWHWEHWcYmoCXR2Al2HCeQ
 +eBULyPEIE2J1u2/2SFseYntb+cwQzygLPFjw2k2CLtW4tX93YwTGEVnIblvFpI7ZiEZNQvJ
 qAWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECo3PbsZ+bdzDOe/VR7xAjEwfjIUYJDmYl
 Ed5+9dAkId6UxMqq1KL8+KLSnNTiQ4ymwECayCwlmpwPTA95JfGGZgamhiZmlgamlmbGSuK8
 ngUdiUIC6YklqdmpqQWpRTB9TBycUg1Ma/1Yvq/f/vKkVazqMv7XrUbn7B8+0tnxctWDZ9qx
 h2t92tfkhMj0znTbn79H/My7jY/WdJfxzm9Sf8R5yzxJnCFa7K3wioUCuiai23bfCmfoU966
 ruyF8cz21r+/03YukLzF9iztc5jS9bUlu90dzy6JE3h50Mrtsfoe+ejMG9GPKsom2v3e3SV1
 ZFv8TGuX+7LrWXnqn97Ki7T5U/Mh1nfuxOXvPty1XZiyZBNvrF8vu175Fdk78bwnfKPO982M
 arxwxu3Iw81659k7lIP2X79yk3PG4xtc9xcafd6Z+/RBndrNoK0l6rOOfTUPYVDuORd76rcp
 T8gaORNDt3NzDrU0yH+/cX0yf8CnsElsM5RYijMSDbWYi4oTAUUKGvBXAwAA
X-CMS-MailID: 20220413175344eucas1p133cc0ea003c315281c761b6367df8b05
X-Msg-Generator: CA
X-RootMTR: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
References: <CGME20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad@eucas1p1.samsung.com>
 <20220412112745.44108-1-p.raghav@samsung.com> <YlWp468pKUrRLFTH@google.com>
 <5a86b90d-ec5d-6c83-e8dd-0ced976059fe@samsung.com>
 <Ylb4q4MKk/07Mwne@google.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, On 2022-04-13 18:22, Jaegeuk Kim wrote: >>> The
 section size actually supports multiple 2MBs, not PO2. >>> >> Thanks a lot
 for the clarification. I will remove this statement in the >> next revision.
 [...] Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nehBg-00FRCs-Mj
Subject: Re: [f2fs-dev] [PATCH 0/3] f2fs-tools: return error for zoned
 devices with non power-of-2 zone size
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 2022-04-13 18:22, Jaegeuk Kim wrote:
>>> The section size actually supports multiple 2MBs, not PO2.
>>>
>> Thanks a lot for the clarification. I will remove this statement in the
>> next revision.
>>
>> I was partially misled by [1] where it is stated "Segments are collected
>> into sections. There is genuine flexibility in the size of a section,
>> though it must be a power of two.".
>>
>> Just FYI, when I did a quick check, there are some assumptions in the
>> zoned support for f2fs which assumes the zoned device size is a power of
>> 2 such as in the __f2fs_issue_discard_zone. So if I am not wrong, when
>> we remove those assumptions in f2fs for zone size, then everything
>> should work fine provided the zone size is a multiple of 2MB. Am I
>> missing something here?
> 
> All the implementaion assumes PO2 by block layer in kernel, but basically
Yeah, at the moment it is not an issue as kernel rejects non power of 2
zoned devices as a block device. But we have been having some
conversation around this topic [1] to remove this constraint from the
block layer.

> f2fs could support 2MBs. So, I remember there's no PO2 check in f2fs as such.
> 
>>
>> I am new to f2fs but is there testsuite that I can run for f2fs apart
>> from the two tests listed in (x)fstests?
> 
> I usually run 1) full xfstests, 2) loop of fsstress + shutdown. You can find
> a script here. :)
> 
> https://github.com/jaegeuk/xfstests-f2fs/blob/f2fs/run.sh
>
Awesome, thanks a lot :)

[1] https://lore.kernel.org/all/20220315135245.eqf4tqngxxb7ymqa@unifi/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
