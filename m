Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364297B90A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 10:13:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqpoK-0006br-Vh;
	Wed, 18 Sep 2024 08:13:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sqpoH-0006bL-14
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 08:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FoClbYiaISSy4tE9A/eMkUtSrOUByd+2+OMRpBKthhQ=; b=LLO+TfqDGcEdvpg0N5NyvOIbqn
 Vcy9SEwpR7Tk87LXx0renou587SyBTLQ4lh+bSCRjVf2g/b24wyFBY4N6pIMxFVwPFUVWl2+qFWQm
 vcUjOIXV9kgu1Q3g2sMzA4ww0p9xkwJEzW7+HDyvxgR8W91DzIPkTlfA9VutcJGqSwnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FoClbYiaISSy4tE9A/eMkUtSrOUByd+2+OMRpBKthhQ=; b=lIy4iUdfv18JZyHGXGtr6yYAJO
 By/5dPv1UrJUQ92GnFWcwQ1huaiZr+bzuM35CnT84/Rkddlk1YR1tWUcJnjIVzku2YBllscxWo6+6
 limaVBrkQkqxjDVBjPM/7c7yyF5dy0zhOMVyS3UpZxZ5W/ikdtlB9XgxgkIOKBPdPApI=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqpoF-0002kc-75 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 08:13:13 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240918081259epoutp03c328814e4e3518511360ea2a394b5ade~2SHYNFMDw0204702047epoutp03B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Sep 2024 08:12:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240918081259epoutp03c328814e4e3518511360ea2a394b5ade~2SHYNFMDw0204702047epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726647179;
 bh=FoClbYiaISSy4tE9A/eMkUtSrOUByd+2+OMRpBKthhQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=W3aO/XXY8kdv50riW7NNgh22FeVNbrsdEJK5EOR2GxPimr+vhWpzIvGHoMljFTNUo
 aDvSqSeyn8++P4WKaSD2qPPbxI/CZepf5fnBXeRHL+1l0e1Z0l7AGxOmvg9bUd91A3
 JbwUZfi5chpTViM/uhMO0dTai/T/Jut9Fx12IO9o=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240918081258epcas5p1823dac2b9a9e6de8274eb13f917c7f68~2SHXsXn9c2910929109epcas5p1C;
 Wed, 18 Sep 2024 08:12:58 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4X7rxN46Jdz4x9Pw; Wed, 18 Sep
 2024 08:12:56 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.5C.09642.88B8AE66; Wed, 18 Sep 2024 17:12:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20240918081255epcas5p274303a976333fd9a6c74ae0ff2147342~2SHUxomyX0868808688epcas5p21;
 Wed, 18 Sep 2024 08:12:55 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240918081255epsmtrp26af4e1a22d02d7d933be6f1d3f42a37c~2SHUwqAVe0537805378epsmtrp29;
 Wed, 18 Sep 2024 08:12:55 +0000 (GMT)
X-AuditID: b6c32a4b-879fa700000025aa-94-66ea8b886ab7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 71.6F.19367.78B8AE66; Wed, 18 Sep 2024 17:12:55 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240918081252epsmtip18dd83ba1309566b2e110c9a05d3ffe5d~2SHR36ysF1791217912epsmtip1_;
 Wed, 18 Sep 2024 08:12:52 +0000 (GMT)
Message-ID: <197b2c1a-66d2-5f5a-c258-7e2f35eff8e4@samsung.com>
Date: Wed, 18 Sep 2024 13:42:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240918064258.GA32627@lst.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUdRSe3713X4wLlxXiByNCl8oweawu9MMBskHzjlSD08OJmYINLo8W
 dnf2QUaOgQ6o0IJiAa0UZAjDQhKPlOeUEBIKw2NBZAWGxzICOxiPqMzCdvei8d93znzfOd85
 Zw4fF2XxPPjJcg2jkktTKK4Dca3Td5ff2dzFhMB7tyGqnsjnIkvnKkCFyw9x9HjiPobGfm7G
 UFV1F4YuFZ3GkLlWj6O6fD6aHV/joYcVBh4q6LgDULvpJTR0+TBqa+8hUGnFHA/ljjZxUWX3
 BoauPSrF0VXLbwTq/7ebg/r1JbwDz9DG4Ui6f7KOoAsLbnFpY5+Wrjec49IN5Z/RrWVrGN06
 lsGlV+ZMBJ3XaAB0b9kvPHqtfiddb17CooTRstAkRhrPqLwZeZwiPlmeGEZFvhUTERMUHCj2
 E4eglylvuTSVCaMOvh7l91pyinVmyjtNmqK1pqKkajUVEB6qUmg1jHeSQq0JoxhlfIpSovRX
 S1PVWnmiv5zR7BcHBu4NshJjZUmfDw5wlNcdjj+utYAM0MDPAQI+JCVwuLgXzwEOfBHZCmDj
 jSYuG6wCOJRVjT8NFn7P5D2RfDNfRdiwiGwG8NSQgsVLAFb1ptqwkAyHv07m2PkE+TxcqPmO
 x+adYc9XZrvWlfwQ/j1SAmx4OxkGc3Wj9jxOukGTuRSzYReSgnOLfcBmAicrCHhlpd9qj8/n
 kr5w4KLWxhGQe2Cd7jKP1XrB60sldtOQrBTAm/Umjo0PyYOwrS+C9b8dLnY3bs7iAdcetHNZ
 LINTM1MEi0/ApoY8DotfgRn/3LWXwa1ta1sC2FaOUPfIjLHVhfBstohlPwsnC+Y2lW5wurh8
 0wANuzLd2W1O4NBiMPLOA2/9lqXotwyv3zKM/v/GZYAwAHdGqU5NZNRByn1y5uOn145TpNYD
 +z/sjmwCM1PL/h0A44MOAPk45SJ0W15IEAnjpZ+kMypFjEqbwqg7QJD1OhdwD9c4hfWh5JoY
 sSQkUBIcHCwJ2RcsptyElqyv40VkolTDyBhGyaie6DC+wCMDa+vb8ULV6R/y704fvXXMvfe9
 FaVO5i6oLs/D4978oDLHs0szfiTnfcvoqFC/d6yiPFOOe01/75jsEuN8ONx5ZjXgAPBZ93Eu
 bPG4GXvIOO7+9kbRydmWvFNpsaGjdETBxfOHRiTvOKzmmiLGa350ZH7aP1PXqJB9aijNPhYN
 3cadPjqhKPpSt61wCKu8Gu6aftSpMyFWULto7DPtrLnhy9lBLomcj6Q7tFfNEsPpJx+sc0e+
 9do10a1xjV7OOXNpz/35jXc3BoSv3uEgT6QxXwh/UWI8LhyUXfmi47n5cz1U7BtTqvV7s91n
 PNuW/mgu99ElVBQPDv/lhJtuT61mj6Rt+5Mi1ElS8W5cpZb+B0mzXdSYBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xSYRzGe885co401pE032WzIq1RaNnF3nX/0NZZrVZtWatlUp7IKegO
 YYq5rFwlFF1nkywdGYW2DKywhV0085KmaVNy0WVBF5kVUZmVmcDa/Pbb8+x5/s+HP4ULXxPj
 qRTFbpZTSNNEPD5xq04UGXNY27tzlsE2GlU4jvOQu+4rQIVfBnA05HiPoef3b2PIVFGPoXNn
 D2LIWanHkfk4hd6+8JJowFhOolO1XQDV9MxAHYYVyFbTRKASo4tE2u5qHrrc8BdDt36X4Oia
 +zOB2gYbglCbvphcNo7pfLaKaXtpJpjCU808prNVxVjKC3hMVdk+5k6pF2PuPM/jMR5XD8Ho
 bpQDpqX0Icl4LZGMxdmHrRVs5i9KZtNSMllu5pIk/q6jT9uDMqz8rKFKN8gDVZQGBFOQngsv
 fDARGsCnhLQVwP5ObVDACIcHu36SAR4LTX/f+1lIuwG0GeN8LKCXwMaXGr9O0NHw49WLZEAP
 gU1FTsLHYfR2aHu1H/PxWHox1B7r9uv4cH+Ps8Svh9Ii6OptBb4ROG0k4IMzfVhgkQOH7/44
 hxdRFI8Ww/bTKl8gmJZA8zEDGSiKh5qbGhDgidDaV4yfAEL9iB36Eff0IyL6EZFSQJSDMDZD
 KZfJd2TExSqlcqVKIYvdkS63AP8TTF9fDYyVg7G1AKNALYAULgoVhH/5uFMoSJZmq1kufRun
 SmOVtSCCIkThgilpBclCWibdzaaybAbL/XcxKnh8HlaRvdQiGVKIPwzUGa5MjioLCsmLmOC5
 aq1yL9R52iOrtZ9WRqoULR6r6lJLIp4Yn33v5ALdr4Jp0ed/mFB0uupNroT6OmrO4/6obml+
 yJ4962aoc3TXWsMatZy2CJZcT/085ltWgiL3gHrl5B+DOtMRA9cFKvd6vQydk7P8Ebaow47P
 T1xQH5WUVUyKtq45i3lWV9dH1HfaJ9ibWvuLUprncfn7xF0bzKXBktDmu9pMdVRFzbtDWzY5
 XDaz2iWWm97EfLe0NxZvrbkbo39gP8/MnirWC2+Eo8aGTLFsf+8TicPUcs4qm7vxSrw9blnf
 7/SkwwlrxuUy2KQV150iQrlLGjcd55TSfwfhi8FzAwAA
X-CMS-MailID: 20240918081255epcas5p274303a976333fd9a6c74ae0ff2147342
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
 <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
 <20240917062007.GA4170@lst.de>
 <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
 <20240918064258.GA32627@lst.de>
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/18/2024 12:12 PM, Christoph Hellwig wrote: >>> If the
 device (or file system, which really needs to be in control >>> for actual
 files vs just block devices) does not support all 256 >>> we need [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqpoF-0002kc-75
Subject: Re: [f2fs-dev] [PATCH v5 4/5] sd: limit to use write life hints
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org,
 Nitesh Shetty <nj.shetty@samsung.com>, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/18/2024 12:12 PM, Christoph Hellwig wrote:
>>> If the device (or file system, which really needs to be in control
>>> for actual files vs just block devices) does not support all 256
>>> we need to reduce them to less than that.  The kernel can help with
>>> that a bit if the streams have meanings (collapsing temperature levels
>>> that are close), but not at all if they don't have meanings.
>> Current patch (nvme) does what you mentioned above.
>> Pasting the fragment that maps potentially large placement-hints to the
>> last valid placement-id.
>>
>> +static inline void nvme_assign_placement_id(struct nvme_ns *ns,
>> +					struct request *req,
>> +					struct nvme_command *cmd)
>> +{
>> +	u8 h = umin(ns->head->nr_plids - 1,
>> +				WRITE_PLACEMENT_HINT(req->write_hint));
>> +
>> +	cmd->rw.control |= cpu_to_le16(NVME_RW_DTYPE_DPLCMT);
>> +	cmd->rw.dsmgmt |= cpu_to_le32(ns->head->plids[h] << 16);
>> +}
>>
>> But this was just an implementation choice (and not a failure avoidance
>> fallback).
> And it completely fucks thing up as I said.  If I have an application
> that wants to separate streams I need to know how many stream I
> have available, and not fold all higher numbers into the last one
> available.

Would you prefer a new queue attribute (say nr_streams) that tells that?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
