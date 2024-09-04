Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892196C16C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slrRp-0005zw-2G;
	Wed, 04 Sep 2024 14:57:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1slrRn-0005zp-O6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/XD9MSPm2ieh7tYbx02NG5OSwwR0Rs4WQ1DiKKxiIlc=; b=PZoUCwJ/ox4ksdGcL1gSQy4Qn1
 fnhKqfWEZr72Zj9aAIQJRFzpVlYvhf+1uh/r4XoF9vvFqpQiu5EQ0I2OgKmh13F+mk40c0m5bjjUR
 e8paIdun/J4HR/FriQeA+vg6v7Oe5O4cSGSySOWoUxEZDumvr2+pZEp+PvcQNQ9ZMd9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/XD9MSPm2ieh7tYbx02NG5OSwwR0Rs4WQ1DiKKxiIlc=; b=m7sL9P2m3o8Kl9yu3hcApibcn0
 BDxVHmx39f2KQWidrtGXbwlbtBzj1gdugF1dAJgWJaGB7fYOl91F3uYKPKC8EW81stpN3nc8kQ591
 mVlxZvZDZuGyxj6siMG9p8kJDcEkuYgnH8NXhutjucqvo8EAJi4T3NWbO5VUVcckanZQ=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slrRl-0007tO-6h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:57:27 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240904145712epoutp013b080bfa5a27be1745a5782416dfbff2~yEmUlaYAS2365623656epoutp01h
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Sep 2024 14:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240904145712epoutp013b080bfa5a27be1745a5782416dfbff2~yEmUlaYAS2365623656epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725461832;
 bh=/XD9MSPm2ieh7tYbx02NG5OSwwR0Rs4WQ1DiKKxiIlc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tq7EDconfAAxtqzrR0A2EYizCmpDG4aADIRh7WMATDaYhe7mBUC+hV/f4w95OCHbG
 N3tropibV5reJDG9mXkx7U1E0Meop0P+bWBeP7knpW19vZ9Z1UWdqtvZvyvmbm4eh4
 8vbbQ0LhF4GRsWACIy5UaJFd4WRbZq3W/VNGW+ck=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240904145712epcas5p16b1e59b36b65364e750ad6186f3c40c0~yEmT86gsc0537605376epcas5p1a;
 Wed,  4 Sep 2024 14:57:12 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WzQZG2H28z4x9Pt; Wed,  4 Sep
 2024 14:57:10 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 02.09.09743.64578D66; Wed,  4 Sep 2024 23:57:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240904145709epcas5p1500f0810833c70c779c5b5d911fa7842~yEmRhvbRj0635006350epcas5p1x;
 Wed,  4 Sep 2024 14:57:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240904145709epsmtrp2579123e002487ee76c7e08d31d1d3da9~yEmRfmIxb0123901239epsmtrp25;
 Wed,  4 Sep 2024 14:57:09 +0000 (GMT)
X-AuditID: b6c32a4a-14fff7000000260f-69-66d875463bee
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.1B.08964.54578D66; Wed,  4 Sep 2024 23:57:09 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240904145705epsmtip23467e1ecdd38069c57e5f46971b556e1~yEmN4AJW22167321673epsmtip2W;
 Wed,  4 Sep 2024 14:57:05 +0000 (GMT)
Message-ID: <cd7fa0b4-9f85-a73c-3f28-baa234a2ae7c@samsung.com>
Date: Wed, 4 Sep 2024 20:27:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240903-erfassen-bandmitglieder-32dfaeee66b2@brauner>
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxbZRTOe3t7e8HUXAvIa1VgjSyOCaN8eVkATSRwwyASly3zI0IHF1pb
 2q63ZRshSmCbfGyjsIXOgqFWBAfKhCLjYxhSRLYJgiKDEj5dEUcFxrqgSHW2tFP+Pe85z3Oe
 95yTg7N4xRw+LpGraZVcJBNg3mjnwL4XQ5M0UznhzZtPkGOtLYBsma3ESNvAA0DW3N9ikY9m
 lxHS0t+NkFdbBhGyVleCkNZrehbZVomTd2fsHHKrsZlDVpvvALJvej/5kzGZvNF3CyXrG5c4
 ZMVkF0Y2Df2DkK22dZQc1ddxXvWjxn8+RHXrZznU6FwbStVU38ao8REN1d5chlGmhg+oXoMd
 oXotRRi1sTSNUhc7mgE1bPiWQ9nbA9K5b0njxLQom1YF0fIsRbZEnhsvOHQ447WM6JhwYagw
 lnxZECQX5dHxgsTU9NAkiczZriAoXyTTOEPpIoYRHEiIUyk0ajpIrGDU8QJamS1TRinDGFEe
 o5Hnhslp9UFheHhEtJOYKRU3XOhnK+9wT63rv+cUgS3vcuCFQyIKNn1twMqBN84jegFcrqpl
 ux8PABzsn/VkNgEc0J5FH0t05j/ZLswj+gC0lu5xk1YBvFSxDlwJLpEAtyoaEBdGiRfgRslV
 zB1/Ct76yLpTyI84Dv+aqNvh+xCx0DyyulOURfjDaWv9jtaXCIHFxg3EZcAizqBwcGnQKcZx
 jNgHxy5pXBwvIhFum2qBWxsIr6/WsdwfbfGCcyMenAgbOwc82AeuDHVw3JgP7Wt9mBtL4cIv
 C54mC2GX6SLbjV+BRY4ptsuW5bS91nPAbfUkvLBtRVxhSHBh6Tmem70HzlUveZT+cPFKgwdT
 cLr3oWeeDgA7iu2YFgTpd01Fv6t7/a5u9P87GwDaDJ6hlUxeLs1EKyPk9Mn/9p2lyGsHO8cQ
 ktIFFhfuh5kBggMzgDhL4Mu1+U7l8LjZotMFtEqRodLIaMYMop3rqWLx/bIUzmuSqzOEUbHh
 UTExMVGxkTFCgT/XdvbjbB6RK1LTUppW0qrHOgT34hchpWud22cqr0Re/+Z3m3g+2Jb54f76
 ma5yn758B2bybtWl/j3En3y/pyAt2cGSls3mrCSuWy3lPZZPPv2uKha3J6T98NXEwFYE9D4f
 vfcLo3Av89x4sOmuJjOsxP6bXOvz9POfl1UP30OffVsrLnovdLgqYDMwLuKNxgWLNrf04GGk
 Lcl4cuadJot48VFAaq3jS/m9eYZjHGXePZ0amaK1JktsOq3pMuEjeZN/vubEPHX7ZuCNieCM
 14/4F56SGT+bV9q7jdMpSYWyo8cHj92sEOjW08YWj76UuiwzGDIfsn/0uzxH/SopXJtcmbKd
 qP7jXE1nfzKhc9gix6X5aIH0yDEByohFwhCWihH9CwmGeIWVBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGe++9u/c6Wt2my9eKglVURqtByJvZB1R6Q4miKChKV7up6Nba
 dX2IpLagmpRl6GpqmpjiBopOs1qWrSxsibOFTmuWH2FlpmZRyz7nCvzvx3me5zznj0Pj4tfE
 LDpRncJp1YpkKSkkbjyQzlu2Sec+uML4LAQ5Ky0AWTzZJBp88AmgvBEvjn57BjDU2XgLQxWW
 JgzlG/UY6q8y4ag6m0Z9L8co5C0zUyjH3g5QQ9dS9KwkCt1paCZQUdkbCmV13CRR+eNfGKoc
 HCZQq6mAWi9hXc+j2VsmD8W2dlcTbF7OE5J1tejYGvNZkrWWprO24jGMtXVmkOzomy6CPV9r
 BuzT4ocUO1Yzd6totzBCySUnHuG0y9fGCRNKzzUKNO2iY8MmB5UBvEIDCKAhsxIa7d8EBiCk
 xYwNwAbLEPALwVDf/o3ycyCs+DVA+U2DAL7/XkL4BBGzFnqzSjEfE8wCOKqvIP3zGbD5Sv+E
 R8Lsh3deZU54AplV0N4yJPAx/regq79oYh7EhMKTJaOYrwBnThEwx/0B+Nt+AHjdmocbAE2T
 zBLovKTzBQKYjXDcmg/8i8Kgoc7wj+fB+qEC/AIQmybdYZrUZ5oUMU2KFAPCDEI4Da+KV/Fy
 jVzNHZXxChWvU8fLDhxS1YCJJwhdchPUm0dkdoDRwA4gjUuDRINB7oNikVJxPJXTHorV6pI5
 3g5m04Q0WBT89pxSzMQrUrgkjtNw2v8qRgfMysCqe2tdsUXpIRG32zq2P9m7hVg4jM/cU5f/
 YqSAbw3sHs09XaHMSx2XGLqd5Wme9A5bHAqumytI3loVkdiWVt4bHv6ZkU8p5GXrbs+Rvj9l
 bUtyhCo2riiINTocmS/LUmZ2ZjkCjx/uK3Qr+/L3/6RrW5oGUmOqOu/NftrWWuy0hGfre6bm
 bvsJG5qiKunp042wzpzpuh81vu/utU3yMG/KvmnubEnMaiqs0XC954dG4tx2JGDDu2jiBHkt
 4Wjkh8j1MfMvZ3icqp5HH/HwpLfrdgltO3ecWdT7pVym33zP+jVy+buuV2sWH96hXnqsPlJg
 i84dm9bc7Sq9mhYH0i5SUoJPUMhDcS2v+AN9Se0qcwMAAA==
X-CMS-MailID: 20240904145709epcas5p1500f0810833c70c779c5b5d911fa7842
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171409epcas5p306ba210a9815e202556778a4c105b440
References: <CGME20240826171409epcas5p306ba210a9815e202556778a4c105b440@epcas5p3.samsung.com>
 <20240826170606.255718-1-joshi.k@samsung.com>
 <20a9df07-f49e-ee58-3d0b-b0209e29c6af@samsung.com>
 <20240903-erfassen-bandmitglieder-32dfaeee66b2@brauner>
X-Spam-Score: -3.6 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/3/2024 8:05 PM, Christian Brauner wrote: > On Tue, Sep
 03, 2024 at 07:58:46PM GMT, Kanchan Joshi wrote: >> Hi Amir, >> >> >> On
 8/26/2024 10:36 PM, Kanchan Joshi wrote: >>> Current write-hint inf [...] 
 Content analysis details:   (-3.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slrRl-0007tO-6h
Subject: Re: [f2fs-dev] [PATCH v4 0/5] Write-placement hints and FDP
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, linux-block@vger.kernel.org,
 vishak.g@samsung.com, jack@suse.cz, sagi@grimberg.me,
 martin.petersen@oracle.com, gost.dev@samsung.com, amir73il@gmail.com,
 jlayton@kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, James.Bottomley@hansenpartnership.com,
 linux-fsdevel@vger.kernel.org, chuck.lever@oracle.com, javier.gonz@samsung.com,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org, hch@lst.de,
 bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/3/2024 8:05 PM, Christian Brauner wrote:
> On Tue, Sep 03, 2024 at 07:58:46PM GMT, Kanchan Joshi wrote:
>> Hi Amir,
>>
>>
>> On 8/26/2024 10:36 PM, Kanchan Joshi wrote:
>>> Current write-hint infrastructure supports 6 temperature-based data life
>>> hints.
>>> The series extends the infrastructure with a new temperature-agnostic
>>> placement-type hint. New fcntl codes F_{SET/GET}_RW_HINT_EX allow to
>>> send the hint type/value on file. See patch #3 commit description for
>>> the details.
>>>
>>> Overall this creates 128 placement hint values [*] that users can pass.
>>> Patch #5 adds the ability to map these new hint values to nvme-specific
>>> placement-identifiers.
>>> Patch #4 restricts SCSI to use only life hint values.
>>> Patch #1 and #2 are simple prep patches.
>>>
>>> [*] While the user-interface can support more, this limit is due to the
>>> in-kernel plumbing consideration of the inode size. Pahole showed 32-bit
>>> hole in the inode, but the code had this comment too:
>>>
>>> /* 32-bit hole reserved for expanding i_fsnotify_mask */
>>>
>>> Not must, but it will be good to know if a byte (or two) can be used
>>> here.
>>
>> Since having one extra byte will simplify things, I can't help but ask -
>> do you still have the plans to use this space (in entirety) within inode?
> 
> I just freed up 8 bytes in struct inode with what's currently in -next.
> There will be no using up those 8 bytes unless it's for a good reason
> and something that is very widely useful.

I see, so now there are two holes. Seems the plan is to co-locate these 
and reduce the size by 8 bytes. Thanks for the pointer. Primary reason 
is a bit cleaner plumbing, but I'll manage without extra space.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
