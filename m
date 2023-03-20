Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A11A6C0B86
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 08:41:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peA9N-0003I0-9b;
	Mon, 20 Mar 2023 07:41:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=436eb87b3=damien.lemoal@opensource.wdc.com>)
 id 1peA9M-0003Hn-7f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 07:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNnp65p18r9InImb3TefnHBuhcbVhzynIwAJbR29uJY=; b=NXTL5n5SjLC4whRNZmUx0JXz78
 2tbvxim6aUd8nBEXRsKa8JEh6SkiXeOe1yLMjzg924Vada+8U5nUZ+VMh10LLOqUBaCEZ2Wc+ByQk
 uwpOFGckxBlO4z+FMaBatsYuIg6J1UHdaKLezq/tYXD+u5u5hCxSFTlGC+aR2L6B0aQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNnp65p18r9InImb3TefnHBuhcbVhzynIwAJbR29uJY=; b=LXABzoOejdk4oTd27VMzGAvXGS
 5Vbt5X1+ljc4vosJxw06okgFuDCsOzVVTsAs3fBamhJCkgbjdYH50IVi59Fp9GEyYrCRhnLTr+SLg
 TRZOAa7lgfHiyBTgyyOye1Qa6TaBAM0+jYB6I1+ZWpxk/XW3qvyjamRcbYMjGoBFI048=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peA9I-00052o-Mk for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 07:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1679298104; x=1710834104;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PznhUX2rDF8uhJla7kd2cwVnZx5w5yiNB4r5BQcdnfM=;
 b=jsMi7Hh0dU4SH7t1nmS3eFb6sUiWfXVMfMYC/A0n4rKsnRkxfpOOY7hR
 SAY0PREeHV1dcdaSb90rhjKi5L8ypNWYxO9Wra2lnnS5cqfEjTXTImJ4s
 ToZ/Lst9ivh1WYWqDwMC8tBBsM6ufBWJlWh2LMS11U80RMK9/WMJxQiKe
 F1e2LBshjHGI0uYrfBZkMrKmBIo9dE2VYo8Atpf9DuOAAA09P/4gvIMt5
 So163/e/u1lubw5ZSB68h8LqPpeGpJENmr7m5GTJEee3qnWTHwSqTEBg7
 U+Yv+1uiF+2Hw/trQ6tWPSr2xRdNdEmksue/OC7kwM4gU//UF27eKOW5H g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; d="scan'208";a="230987199"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 15:26:11 +0800
IronPort-SDR: ikhI0//A8SUb1BiiLf8spFh1JHtd0PFqIrjaVtWHn48TwCrBHso5IBFu0gaOAPwnD6nyJ7AUFX
 cALZ55cEXY0F5uDizoDDu05LNKFqnnirxkTB4Fh8vuHcySXVqnIxGKxtWKmEUsYj8qFToVWgXF
 Vc1X8zTZ6TvEtfV3uEuteUPFenMt4ZyfbQ1k46ccaMAeJRjlOLLS6JQCLmU2T9berCzypnUfuc
 pViUxn/5E9AtoCY3PikPYzyBX5SNmgA2QviiVL+yB276GiPYFj5HZ9K2y4Zd2ldQKrLyv+EjBF
 nxU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Mar 2023 23:36:51 -0700
IronPort-SDR: w6p2V19CrjXccFw30jHvl2M1D9hq9qDdRo6uhgip0UEZe6LASJ1JulqbtasZl8wtaE5CB0CIsw
 /u4in8/pd4vgHOWygzJ8fETypmZnt6GQZrR5hHE4U7c3Fa3xfEIc+sulY4js4xFvjHvzqO/gT0
 8J+VSFfGe22m1DXpRiNryvj54dDtFT+3J+Vm5xk+VIhH+HOfHNw/+cnn1iMFhQgUmtN3dMRQl1
 MfIDOkWZD519gGMa7XuODrXMrwofXgP6GEYDX8WillAqWbQOZ6gYjmZwgRR5HC0Q88ICQJfOga
 XQY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 00:26:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pg5rL1V3Sz1RtW2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Mar 2023 00:26:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1679297169; x=1681889170; bh=PznhUX2rDF8uhJla7kd2cwVnZx5w5yiNB4r
 5BQcdnfM=; b=Ac3sR0XYJ+rryJ+0bDOPKxCm+dcSwHcMLzkGxuGt8+HwZ87G7ax
 pAFVEfaZLRQ1T7YBu9pTJb2iOB0dq+m2M50+2ySCb+VWMEj6z8KBJcfvkX/VTy5y
 HdsZwpvEu2xSrqc4DcASona2/D8FSQf2eX7sdS1/ZdFCrT/cmr56n/dcPEizamwB
 YvpCPWbz6qWy+PWRiDVh/KqVyD37i1IhQ4/yFHZk59+5WH/VWBjihD6KvLqKMHsL
 iYmgtRtkq5BDuKsPoQJio8UBdylvkAVkIe2vLW8QNxxsm80THSUesX6KayIzGn6+
 /6kD3KtQY7keflXYjvtNZUIrzhBwhIGlsKA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ykisSdT5ORIj
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Mar 2023 00:26:09 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pg5rB164vz1RtVm;
 Mon, 20 Mar 2023 00:26:01 -0700 (PDT)
Message-ID: <982b6aa9-4adb-acef-d9d7-9a1764a66213@opensource.wdc.com>
Date: Mon, 20 Mar 2023 16:26:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 trond.myklebust@hammerspace.com, anna@kernel.org, konishi.ryusuke@gmail.com,
 mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
 richard@nod.at, djwong@kernel.org, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
References: <e4b8012d-32df-e054-4a2a-772fda228a6a@opensource.wdc.com>
 <20230320071140.44748-1-frank.li@vivo.com>
Organization: Western Digital Research
In-Reply-To: <20230320071140.44748-1-frank.li@vivo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/20/23 16:11,
 Yangtao Li wrote: > Hi filesystem maintainers, 
 > >> Hard to comment on patches with this. It is only 10 patches. So send
 everything please. > > If you are interested in the entire pa [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1peA9I-00052o-Mk
Subject: Re: [f2fs-dev] [PATCH v2,
 RESEND 01/10] kobject: introduce kobject_del_and_put()
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/20/23 16:11, Yangtao Li wrote:
> Hi filesystem maintainers,
> 
>> Hard to comment on patches with this. It is only 10 patches. So send everything please.
> 
> If you are interested in the entire patchset besides Damien,
> please let me know. I'll resend the email later to cc more people.

Yes, I said I am interested, twice already. It is IMPOSSIBLE to review a patch
without the context of other patches before/after said patch. So if you want a
review/ack for zonefs, then send the entire series.

> 
> Thx,
> Yangtao

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
