Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67789976E28
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 17:51:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1som6B-0007vt-0r;
	Thu, 12 Sep 2024 15:51:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1som69-0007vm-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 15:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9VILr0qkYP4rvJKavSsOF6cu9G5TqXZShkha385+XA=; b=mAnYd+qwS7AodnkKokrAAYmCCU
 S9Zqtjc9XRpdvedvAV+2Ae+obBs+4WtPiscodBF+8FMXewnHrfa/vyg6eJ5KY64zilN2hTBbKREHc
 71t6R/27B6WgemLz7p274zIfKLIs9yCEmrEeIYRdg7AZCJrHO33d8JmTpmxEwLE/MXw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t9VILr0qkYP4rvJKavSsOF6cu9G5TqXZShkha385+XA=; b=ch5+n3tBafrorki9ZWVFOoS/2V
 c8TahXJuqAIiUQMpFBCu4eVFThn6i2MQxrXnYzoGtZm3mxHMFsRZM93mAjNz0pLKH39Bh30LFVKnb
 InW15hUG+Wz4Hlb/KveqyOkVms6mDsMQFuYdGSg7Yop1JgFkc6A69CfLqhV9Gopqq3aE=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1som65-0007aV-SK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 15:51:09 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240912155053epoutp03b4411f06b2626db87f1dcd1496db6948~0ifeeKyaL0560505605epoutp036
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Sep 2024 15:50:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240912155053epoutp03b4411f06b2626db87f1dcd1496db6948~0ifeeKyaL0560505605epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726156253;
 bh=t9VILr0qkYP4rvJKavSsOF6cu9G5TqXZShkha385+XA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=cX6fpqCdzPNuJGL7dr3izSpgxqHcAzY/DhTXjK1OxHiBa5quc3tYpqEGI6xdezVZ2
 BXHbIXeZwikjN7W6ze37q0ZUHI78N30v8qxJqshW84Fsnz6WEwTAk33VP7TZXhZlSi
 lyvA+KcAM1vGCFWd1L4fvmW4oVgt7HHSllFSeL0I=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240912155052epcas5p2b02dfa87f8f14aebc50237e7e689f9d1~0ifdLYGGZ0517205172epcas5p23;
 Thu, 12 Sep 2024 15:50:52 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4X4MNV5JVsz4x9Pp; Thu, 12 Sep
 2024 15:50:50 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A1.28.09743.ADD03E66; Fri, 13 Sep 2024 00:50:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20240912155049epcas5p479bf103d5407f12aeeb936b3f167e9f0~0ifazBgj10514805148epcas5p4F;
 Thu, 12 Sep 2024 15:50:49 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240912155049epsmtrp23139a0c48ea642236cda3a4145f6eb0e~0ifav_tYp3192931929epsmtrp2M;
 Thu, 12 Sep 2024 15:50:49 +0000 (GMT)
X-AuditID: b6c32a4a-14fff7000000260f-37-66e30dda6919
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EE.82.07567.9DD03E66; Fri, 13 Sep 2024 00:50:49 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240912155046epsmtip24aa2bc591086ec837e8ed050a50d5f8e~0ifX9cWQI0255602556epsmtip2G;
 Thu, 12 Sep 2024 15:50:46 +0000 (GMT)
Message-ID: <0baddb91-b292-db90-8110-37fa5a19af01@samsung.com>
Date: Thu, 12 Sep 2024 21:20:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240912125347.GA28068@lst.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTZxTG9957aS8kdXcFwivZZrlTQTZKi6VeEBjJcN5Np4jZFmVLuaMX
 aCht0w/ZjBskgKGoKKgwOxzgB8S6iALZQEZUPtaxQcAxEVAQpR2MBqZAEEFkLa0b//3Ok+fk
 Oee8eXGUn8P1xxUqPatVMUqS44X92LopMGSQN5oiut23kbo8dJxD2VunAVXy+BlKLQ+NIdTA
 zUaEunS5HaG+K81BKGuNCaWuHcep0fszXOpZlZlLFbf0Aap58G3qj3PbqZ+bOzCqvMrGpY7c
 beBQ1ZYXCHXF/g9GdS9ZPKhuUxk31pfu/XMH3T18DaNLin/j0L1dBrrWbOTQdRey6KaKGYRu
 Gsjm0E9sgxhdWG8GdGdFG5eeqX2TrrVOIvG8/elRaSwjZ7UCVpWslitUqdHkjr2y92ThUpE4
 RBxBbSEFKiaDjSbjdsaHvK9QOtYlBQcYpcEhxTM6HRkaE6VVG/SsIE2t00eTrEau1Eg0Qh2T
 oTOoUoUqVh8pFonCwh3GpPQ0W20uqrHxv2zpOgqygWVNAfDEISGB53sauQXAC+cTTQDWHW3m
 uIppAH/vs6CuYg7Awvx27suW5X6b29UMYP5cj9s1CaC5/QeO08UjYuCt6iuYkzFiA6ysykdd
 +muw44x1RfclvoALd8qAk72JKNh4a2pFRwk/OGgtR5zsQ5DQNtEFnAEosYTCpafDHgUAxznE
 Jthz0uBET+Id2DvOc7Wugz9Nlq3MA4lqTzg1XwlcU8fBAesd9wbecMJS72Z/ODPVzHFxOhx5
 NIK5+BBsqCv0cPG7MPt5/0os6oituR7qyloDjy1aEacMCR7MP8x3uQPgcLHN3ekHH357wc00
 vH3K4r7bgOPUpzuRE0BgWnUV06rtTavWMf2fXAEwM1jLanQZqawuXBOmYjP/e/BkdUYtWPkN
 wR82gIcjj4UtAMFBC4A4SvrwijmPUvg8OfPVQVarlmkNSlbXAsIdz1OE+vsmqx3fSaWXiSUR
 IolUKpVEbJaKST+ePe+snE+kMno2nWU1rPZlH4J7+mcjca//mrjrg7sBV0sbx7tHSxPjPj4T
 nPdRrnGroCzSVgr1MsV4EGGUXxVOH9h9pFWgNWbVbPlkyCJ74Jt2b2GrUhK559Bfg/t4opIF
 I79oMXR+KkeiqGybTNjWF2T9rE1emeKLc7GqVwIvbesEJbOLARNTn+/p+zvzSdUimZXofXbX
 PSYmlF/3VCgNWz99/vnO2frskJ7tJ2PKuftj18/98r3fWxUB+xKz1moP3ohdTBjJU9JxgEzw
 6ig9Nt+RflqROXyxJLloNvxoUMoy63P9hr0+6hv7uY1gcndu+c26dUmbHwSOMRfDuvtP3R/b
 G2vGhEnaT0NyJja8anzja3vB4TnVCxLTpTHiYFSrY/4FJg+SLJYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsWy7bCSvO5N3sdpBodbdSxW3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvFpEPXGC32
 3tK2uLTI3WLP3pMsFvOXPWW36L6+g81i+fF/TBbrXr9nsTj/9zirxflZc9gdRD0uX/H2OH9v
 I4vHtEmn2Dwuny312LSqk81j85J6j90LPjN57L7ZwObx8ektFo++LasYPc4sOMLu8XmTnMem
 J2+ZAnijuGxSUnMyy1KL9O0SuDKebmphLngqVHHobA9jA+Nxvi5GTg4JAROJ/zeesnUxcnEI
 CexmlPjfu5QFIiEu0XztBzuELSyx8t9zdoii14wSN18+YQRJ8ArYSRxcvg6sgUVAVWLhsg5m
 iLigxMmZT8DiogJJEnvuNzKB2MICNhI7D74DizMDLbj1ZD5YXERASeLpq7OMIAuYBf4yS6z+
 /IsRYttNRoldbc2sXYwcHGwCmhIXJpeCmJwCOhKXX/BCzDGT6NraxQhhy0tsfzuHeQKj0Cwk
 Z8xCsm4WkpZZSFoWMLKsYpRMLSjOTc9NNiwwzEst1ytOzC0uzUvXS87P3cQITgNaGjsY783/
 p3eIkYmD8RCjBAezkgjvJLZHaUK8KYmVValF+fFFpTmpxYcYpTlYlMR5DWfMThESSE8sSc1O
 TS1ILYLJMnFwSjUwHVjE7LytTphBw0U05cuv2WIPGvduCW5am75ap1vshFYge9hbk6QHzoeO
 +07KTUrxtclccf/DZ515itV596cYP311/XNT+K8X9WG5r6N+3zGrEjmZpJjurrxsQd3V7823
 0xQ0JDwP8mhfsF2rtNyP57/+LYZTrIan1e3fzuMO4+LetK3zeDajyukFS19OrxeY1z9tpljN
 7Pg4C+bJWXySx+9wZsx8Hs1wYq6ayaQ70XJ/vyZxrbSPlPtofs5h8wJ1Buvl0UJX5G77u78L
 vtqzICup4GJ/euUmwRWmNlMdLWRuKq/5OUl89eLfgqcKF3o5vOqR8reUfmM8ozVnzhV18d3b
 +3Y7v9oStWM5u94lJZbijERDLeai4kQASkYcrXIDAAA=
X-CMS-MailID: 20240912155049epcas5p479bf103d5407f12aeeb936b3f167e9f0
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51@epcas5p3.samsung.com>
 <20240910150200.6589-2-joshi.k@samsung.com> <20240912125347.GA28068@lst.de>
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/12/2024 6:23 PM, Christoph Hellwig wrote: > On Tue, Sep
 10, 2024 at 08:31:56PM +0530, Kanchan Joshi wrote: >> Rename enum rw_hint
 to rw_lifetime_hint. >> Change i_write_hint (in inode), bi_write_ [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1som65-0007aV-SK
Subject: Re: [f2fs-dev] [PATCH v5 1/5] fs, block: refactor enum rw_hint
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
 bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/12/2024 6:23 PM, Christoph Hellwig wrote:
> On Tue, Sep 10, 2024 at 08:31:56PM +0530, Kanchan Joshi wrote:
>> Rename enum rw_hint to rw_lifetime_hint.
>> Change i_write_hint (in inode), bi_write_hint(in bio), and write_hint
>> (in request) to use u8 data-type rather than this enum.
>>
>> This is in preparation to introduce a new write hint type.
> 
> The rationale seems a bit sparse.  Why is it renamed?  Because the
> name fits better, because you need the same for something else?
> 

Right, new name fits better. Because 'enum rw_hint' is a generic name 
that conveys 'any' hint. This was fine before. But once we start 
supporting more than one hint type, we need to be specific what 
hint-type is being handled. More below.

>>   static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
>> -			  enum rw_hint hint, struct writeback_control *wbc);
>> +			  u8 hint, struct writeback_control *wbc);
> 
> And moving from the enum to an plain integer seems like a bit of a
> retrograde step.

This particular enum is hardwired to take 6 temperature-hint values [*].
But this (and many other) functions act as a simple propagator, which do 
not have to care whether hint type is lifetime or placement or anything 
else.

The creator/originator of the hint decides what hint to pass (userspace 
in this case). And the consumer (driver in this case) decides whether or 
not it understands the hint that has been passed. The intermediate 
components/functions only need to pass the hint, regardless of its type, 
down.

Wherever hint is being used in generic way, u8 data type is being used. 
  Down the line if a component/function needs to care for a specific 
type, it can start decoding the passed hint type/value (using the 
appropriate macro similar to what this series does for SCSI and NVMe).

Overall, this also helps to avoid the churn. Otherwise we duplicate all 
the propagation code that has been done for temperature hint across the 
IO stack.

[*]
enum rw_hint {
         WRITE_LIFE_NOT_SET      = RWH_WRITE_LIFE_NOT_SET,
         WRITE_LIFE_NONE         = RWH_WRITE_LIFE_NONE,
         WRITE_LIFE_SHORT        = RWH_WRITE_LIFE_SHORT,
         WRITE_LIFE_MEDIUM       = RWH_WRITE_LIFE_MEDIUM,
         WRITE_LIFE_LONG         = RWH_WRITE_LIFE_LONG,
         WRITE_LIFE_EXTREME      = RWH_WRITE_LIFE_EXTREME,
} __packed;




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
