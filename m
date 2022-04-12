Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8874FE4C0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 17:30:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neITe-0002aN-Lg; Tue, 12 Apr 2022 15:30:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1neITc-0002aF-TL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 15:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+s2qb2kmA5gV+qQl0xP6jDpsVr3Cf4zhKwyLPUtPblE=; b=XvhVUxhXL74++kDCWrq2JqoiqU
 IcEVOm39UxsvcJGNv3YaoP6zsHO4+xcqi1HjD75DtFbgoPjAPbzLf3HviE42VbHVUmXOweYp2qs+r
 dF40r/AJIZEor78ULQ7x9vK4vLz0hLAFVHfX0XlpS4gOhPiNiRvIhKPc1W0C2fIgwkqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+s2qb2kmA5gV+qQl0xP6jDpsVr3Cf4zhKwyLPUtPblE=; b=EMcVV/GKfQUr5v7KWokJDJ0Odw
 Q96a4DgIiaS4NhFUlfdQZAcwwl7oGj6LfbopWzqVdF+ooA6OnP6JAbnWtO4wz0b4TkPfKJK3nS/1P
 p7LPkSrYfBtHnG0BXgLHq3pvCF1IjdaI75Qy187GGGCxVQScHQSewt4kF7cBmIMXcIPE=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neITW-00EF1l-P2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 15:30:43 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412153030euoutp0105c74b2e22b7228e8cdabae21bb476aa~lL9UPAN910336503365euoutp01d
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 15:30:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220412153030euoutp0105c74b2e22b7228e8cdabae21bb476aa~lL9UPAN910336503365euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649777430;
 bh=+s2qb2kmA5gV+qQl0xP6jDpsVr3Cf4zhKwyLPUtPblE=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=KBl0LEKBniRs1q3vbksFfefDyEDYcamtjaa+HCnlFsMyIb2itrkNSg4JmCsJIGUCZ
 YLgQcgR3U8DQz3nnKdW3IsUm8CMxwJgbmhFEcL4eIzqQEYZBkEKZzJg4bL5nQ+Mz6R
 I8kv0MW/KFfLmBLfJHzPEmF9hH8sID1KwrUUkIFo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220412153030eucas1p29895d9a307605335e44b9b74c8eb2183~lL9UFkIPG1282712827eucas1p2Z;
 Tue, 12 Apr 2022 15:30:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E8.1C.10260.61B95526; Tue, 12
 Apr 2022 16:30:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220412153030eucas1p2194b34a96b6bf9e3de4c7f1f86ceb661~lL9TrYr760204802048eucas1p25;
 Tue, 12 Apr 2022 15:30:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412153030eusmtrp21685ca0f0885703e43046b46cc98e30a~lL9Tqlrg40319203192eusmtrp2B;
 Tue, 12 Apr 2022 15:30:29 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-c2-62559b168d64
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 11.2F.09404.51B95526; Tue, 12
 Apr 2022 16:30:29 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220412153029eusmtip10d2e4afda34ba1b11897eaee36f32457~lL9TY2d_43234532345eusmtip1M;
 Tue, 12 Apr 2022 15:30:29 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.108) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 16:30:26 +0100
Message-ID: <26d7e8b9-218e-b94c-7b2d-763dc0c631f3@samsung.com>
Date: Tue, 12 Apr 2022 17:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <cf4e409966936c1d5e4486f172b45aaad128ae36.camel@wdc.com>
X-Originating-IP: [106.210.248.108]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzneV2x2aFJBtceSFi0tn9jsri0yN3i
 xoSnjBZrbj5lcWDx2DnrLrvHplWdbB67F3xm8mg/0M0UwBLFZZOSmpNZllqkb5fAlbF59n2m
 gn6OinunvrI1ME5k62Lk5JAQMJF423CCsYuRi0NIYAWjxIzZH6GcL4wSr19MZIJwPjNKbNqy
 mhGm5fj1LewQieWMEv1HNiJU3f8wnRmkSkhgN6PEzZ8hIDavgJ3E7P1vWUFsFgFVidXb1jJD
 xAUlTs58wgJiiwpESPy69YgdxBYWcJeY+2QnWJxZQFzi1pP5YAtEBBoZJebdvQfmMAvsY5S4
 du8Y0E0cHGwCWhKNnWDNnAKuEtdefmeGaNaUaN3+mx3ClpfY/nYOM0i5hICyxO/z/hDf1Eqc
 2nILbKSEwAsOiaZfncwQCReJr5//QkNJWOLV8S3sELaMxP+dIAeB2NUST2/8ZoZobgEGxc71
 bBALrCX6zuRA1DhKnHn9nxEizCdx460gxDl8EpO2TWeewKg6CykoZiF5eRaSD2Yh+WABI8sq
 RvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwARz+t/xrzsYV7z6qHeIkYmD8RCjBAezkghv
 v3pokhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe5MwNiUIC6YklqdmpqQWpRTBZJg5OqQYmoY/d
 dq28Tz8W8qko+hoY/zVkVv7fs/TFLu6NfhOeLTnqsSrx6PudnYLG98wlLXczRm6bVc5u8EnB
 7+Bt9lv5pgfmL/x37+rht7t/q/PLVGtZnbsvddZchWvDJJ3arS+4TmYITj7XcEZgWZlQaX9d
 RdqKEhm+LSb5Qm5fHUN3N1/80GQeenjnhUntVoJ7T8k8cuzkXfuwrzPqXdBcqU8zTZ5YfxZr
 ORS6uev/V6+tE/bUnvVLnTHdp2qef2Ke78MlH7/8YXrjGXN50hue+vXzjL3bpi5rmHR8z6ej
 xwS8QtPWdM5dlu11Pk1Ra7Os8qxjioW+bql+PIZeiZcjD7J9Yj5iU7++JYtpVcym1zfZlViK
 MxINtZiLihMBM+aIm58DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7qis0OTDPq2mFq0tn9jsri0yN3i
 xoSnjBZrbj5lcWDx2DnrLrvHplWdbB67F3xm8mg/0M0UwBKlZ1OUX1qSqpCRX1xiqxRtaGGk
 Z2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl7F59n2mgn6OinunvrI1ME5k62Lk5JAQ
 MJE4fn0LexcjF4eQwFJGiXd7m5khEjISn658ZIewhSX+XOtigyj6yCjxcO5pVghnN6PE6oZV
 YB28AnYSs/e/ZQWxWQRUJVZvWwsVF5Q4OfMJC4gtKhAhsWzXVDBbWMBdYu6TnWA2s4C4xK0n
 85lAhooINDJKzLt7D8xhFtjHKHHt3jFGiHU/GCWanxwHcjg42AS0JBo7we7jFHCVuPbyOzPE
 JE2J1u2/2SFseYntb+cwg5RLCChL/D7vD/FOrcTnv88YJzCKzkJy3ywkd8xCMmkWkkkLGFlW
 MYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbmtmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8/eqh
 SUK8KYmVValF+fFFpTmpxYcYTYGBNJFZSjQ5H5ga8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKF
 BNITS1KzU1MLUotg+pg4OKUamOK9GeJyn03n7Hn16No1duWLrgv2/NylXy1xex7LPYlMV6ut
 bNwyYpuXVTafvm8SdJDN5zDvt0MzJ+wzz7g8nWF+7s/C2Ls9y+7f7lojum+pPcP6mu0yS7at
 nn3n3UfevB1TuL6dV3+0gX+J/4lLvDoV99reZOtfTFNbzi9Rarbh1+408Q28krpOOZsvnv71
 UUU05ObBstz11Y+uJUdlBfdvdEkRTt7+df6vaz922iZkXL46ccu18utZV3wv37EX7HHnmSj0
 c8qvXNkrr3mZdvidaml/5ha3Y/urTY63Pxies5ylsPCu7xJv94vtEQeYlf+JrZm0ReWvxPzT
 7zoePCtdNJmjOj39DsPd/h6934d9lViKMxINtZiLihMBIDMWB1UDAAA=
X-CMS-MailID: 20220412153030eucas1p2194b34a96b6bf9e3de4c7f1f86ceb661
X-Msg-Generator: CA
X-RootMTR: 20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451@eucas1p2.samsung.com>
 <20220412112745.44108-4-p.raghav@samsung.com>
 <cf4e409966936c1d5e4486f172b45aaad128ae36.camel@wdc.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Damien, On 2022-04-12 14:16, Damien Le Moal wrote:>> int
 get_device_info(int i) >> { >> int32_t fd = 0; >> @@ -1043,6 +1048,13 @@
 int get_device_info(int i) >> return -1; >> } >> >> + if (!dev->zone_size
 || ! [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neITW-00EF1l-P2
Subject: Re: [f2fs-dev] [PATCH 3/3] libf2fs: don't allow mkfs / fsck on
 zoned NPO2
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
Cc: "javier.gonz@samsung.com" <javier.gonz@samsung.com>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "pankydev8@gmail.com" <pankydev8@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Damien,

On 2022-04-12 14:16, Damien Le Moal wrote:>>  int get_device_info(int i)
>>  {
>>  	int32_t fd = 0;
>> @@ -1043,6 +1048,13 @@ int get_device_info(int i)
>>  			return -1;
>>  		}
>>  
>> +		if (!dev->zone_size || !is_power_of_2(dev->zone_size)) {
>> +			MSG(0, "\tError: zoned: illegal zone size %lu (not a power of 2)\n",
>> +					dev->zone_size);
> 
> The message should be different for the !dev->zone_size case since that
> would be an error.
I just noticed that there is a check for zero value in
f2fs_get_zone_blocks. So this could be simplified with just a power of 2
check.
> 
>> +			free(stat_buf);
>> +			return -1;
>> +		}
>> +
>>  		/*
>>  		 * Check zone configuration: for the first disk of a
>>  		 * multi-device volume, conventional zones are needed.
> 
> Of the 3 patches of this series, this one is the only one that makes sense
> to me. I fail to see how the first 2 patches improve things.
> 
Probably I can squash them together with your comments in to one commit.
Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
