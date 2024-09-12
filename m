Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9C976E3E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 17:54:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1som8r-0000kr-Q5;
	Thu, 12 Sep 2024 15:53:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1som8p-0000kY-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 15:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9wrJPxVcc/Q0n8avU1W8+UAE/X30MRSqz63B1JmEJYc=; b=Zi7Nh3bptL/kkYG/Ez5Th6wssv
 JAm9qNcvIQQ0ayr8yaegHLY9I6JNJOa3E4hKRWK6oPaJKiivTJAwXC/EjYsIPGphGuEbLCmWHcJCx
 oyZuwIlzo0xRZASS5JFPehtVXuj/k6/9kBvWQcQKEBkLSik24obbc23+upCjLrEslZ+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9wrJPxVcc/Q0n8avU1W8+UAE/X30MRSqz63B1JmEJYc=; b=LVEO2WNeR0rto89AfgNRu/70Eh
 p4UlLOAo5JSMb2EEcmm1Fnlm9L3/kyPjvc1zhTfclPlIgQaiULI6xRepT69LFqMm8CJ8yMVN4ihKJ
 udAA77gz1M2RKhMwZ4JJpamoXsTr0CZwaxICB2xTjLXAt5zjpxtJe6bcHFqRXCsmYoL4=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1som8o-0007ke-5j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 15:53:55 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240912155342epoutp029f2c9602a8a892a011d4b72c6cfcf8e1~0ih7aHgmh1269812698epoutp02D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Sep 2024 15:53:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240912155342epoutp029f2c9602a8a892a011d4b72c6cfcf8e1~0ih7aHgmh1269812698epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726156422;
 bh=9wrJPxVcc/Q0n8avU1W8+UAE/X30MRSqz63B1JmEJYc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=juCHpSrzp5D0fbMEiPIVarNtOXxM+3192tqHcOqZIuwGC9LyggBunP62dIic2KJ7B
 6/saSe/IjfDXtORBvv0nLdEzWiP8aF8To2W/nmAAatFjta5MnFyGJYs2I+FoW5pBTG
 yD9U03arrubMyc1kRJC9dsGs8xKQXGDxOHAZMD+Q=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20240912155341epcas5p4042f379347eb854cba992f62811d8755~0ih6aqcbT0034400344epcas5p4T;
 Thu, 12 Sep 2024 15:53:41 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4X4MRm0lwSz4x9Pq; Thu, 12 Sep
 2024 15:53:40 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 60.FD.09642.38E03E66; Fri, 13 Sep 2024 00:53:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20240912155339epcas5p4d1a3fcdb4c2e159b08c1b93a58654532~0ih4w2vs70034400344epcas5p4S;
 Thu, 12 Sep 2024 15:53:39 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240912155339epsmtrp2c63fbfadc476b3d0f006b8ce374a049a~0ih4vqQ-m0049700497epsmtrp2Z;
 Thu, 12 Sep 2024 15:53:39 +0000 (GMT)
X-AuditID: b6c32a4b-879fa700000025aa-fc-66e30e83d58a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 14.A2.07567.38E03E66; Fri, 13 Sep 2024 00:53:39 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240912155336epsmtip1ed839d5dba50a0141cd7184e5d5708a4~0ih1yNt722433024330epsmtip1f;
 Thu, 12 Sep 2024 15:53:36 +0000 (GMT)
Message-ID: <5e453909-bcc4-2184-66e0-81587e5256b7@samsung.com>
Date: Thu, 12 Sep 2024 21:23:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240912130146.GA28535@lst.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0zbVRTHvb9faQva8ZMOucOgpRHicJRWSrmYFTFj+DPwB6Izhhigoz8e
 oS1NH8oW1xHYGLIBA/dwFYE5pFsngwIZHVDD2AOYTOpgCBUQeTgGY7yWCdtAW8qU/z7n3O+5
 33vOyWXiHvkMb2a6QkOpFBIZl+5Gu3xte0Bg7pbxFH5bYSi6OFxMRzPXFgE6Nb+Co3+G72Fo
 sO0Khi5cvIGhb0/nYmiiVo8jUzETjQ8tMdBKtZGBStv7AbLY3kJ3vn8ftVq6aKiiepKBjv5m
 piNDxxqGLj+twNGlmTka6lntcEE9+jJGxCtkb1802TNiopGnSm/Ryd7bWrLe+BWdbKg6SLZU
 LmFky2A2nVyYtNHIokYjILsrrzPIpfrXyPqJWSyWFZ+xM42SSCkVh1IkZ0rTFalibvRHibsS
 Q0R8QaAgDIVyOQqJnBJzI2NiA6PSZfaeuZzPJTKtPRUrUau5QeE7VZlaDcVJy1RrxFxKKZUp
 hUqeWiJXaxWpPAWleUfA578dYhcmZaTVzVgZyjmvrMp5GyMbFLILgCsTEkJYlNNPc7AH0QLg
 rw/iCoCbnRcBNJytw5zBYwDPmw7hzyvqBh4xnAcWAFs7l4EzmAWwpn/cxaFiEeHw8U+G9Xtp
 hB+0PijBnfmXYdeZifW8J7EXPrlbBhzMJsTw7Op5hoNxwgvaJiowB28luHBy+va6AU5U0+AP
 Cz30AsBk0ont0Pq11qFxJXbAH2+e26h9HTbNluEOPSRqXeHPOUUbz46EjTXlwMlsON3RyHCy
 N1x6aKE7OQOOjo3SnPwlNDcUuTj5XZj9bMDF4YvbfWubg5xeW2Dh0wnMkYYEC+bneTjVvnCk
 dHKj0gv++U3VBpPQdqKP7pzVIIBNo92044Cj3zQW/ab29Zva0f/vXAloRrCNUqrlqZQ6RBms
 oL74b+HJmfJ6sP4lAqLNYGx0ntcOMCZoB5CJc7eySuljKR4sqWTffkqVmajSyih1Owix76cE
 9/ZMzrT/KYUmUSAM4wtFIpEwLFgk4HqxZg5/J/UgUiUaKoOilJTqeR3GdPXOxi5UWV5KShjR
 R3LabJY5//1ixV1+y4tTwr3tmqk1HS7vPmk9OVBvkFbHdz3RHUt8NSto6o5597iOF+xrEi8L
 rIcbdM1zZa2VoUfcj0uu9BbKVy/FWUOuc9m8BFnUsd9Tks4EaLwPJFQFfcz3vcF+4abqwL6V
 NyN+6bz6aYnne4d8hnLdg0/EuX+49nB1l3/sbr+FW38Nf/CZ2TVFZsp7lCdavCdwi/EyzrPM
 z5Kjik8rjTF/NB0MV5F7jH0+7IgjNXtWFXmd5fH95/yO+o++EVdbbkL8Zh2RCt2z7keHbzP4
 MMN23M/l5Qz6oqvCsWnWrgaDv5tuiPHJcttgflXQ31rEpanTJIIAXKWW/AtYiBogmwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCSnG4z3+M0g4Mr+C1W3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvFpEPXGC32
 3tK2uLTI3WLP3pMsFvOXPWW36L6+g81i+fF/TBbbfs9ntlj3+j2Lxfm/x1ktzs+aw+4g5nH5
 irfH+XsbWTymTTrF5nH5bKnHplWdbB6bl9R77F7wmclj980GNo+PT2+xePRtWcXocWbBEXaP
 z5vkPDY9ecsUwBvFZZOSmpNZllqkb5fAlbHh9QX2gvfiFQs+3GJvYOwV7mLk5JAQMJHYcOML
 excjF4eQwG5GiRk915ggEuISzdd+sEPYwhIr/z2HKnrNKDFt0m1WkASvgJ3Et33LWUBsFgFV
 iQtvJjJDxAUlTs58AhYXFUiS2HO/EWyosICtxMK/K8CGMgMtuPVkPlhcREBJ4umrs4wgC5gF
 lrFIHJzylgli201GiWeLbwNlODjYBDQlLkwuBWngFNCRWHNsMdQgM4murV2MELa8xPa3c5gn
 MArNQnLHLCT7ZiFpmYWkZQEjyypGydSC4tz03GTDAsO81HK94sTc4tK8dL3k/NxNjOCUoKWx
 g/He/H96hxiZOBgPMUpwMCuJ8E5ie5QmxJuSWFmVWpQfX1Sak1p8iFGag0VJnNdwxuwUIYH0
 xJLU7NTUgtQimCwTB6dUA9PBqxtCXdt35Wd/cXIRkzGcPUvCnWeW806LFimtObP9b078NHH2
 lGCvMwKLP+f/eveKcXqSsLr4KV7t+W8krik9Xfwrz+ZN8VpW30TBRb/K7Y1/tWffWdf9oLxg
 JSuL9bHM589LmBf9Mrav+26vrXn30NpC4Ykssx/0nOpe6Ldns49xosill94bJgctOiDml5J2
 46LIpICEC0+Nld5vTzKaGX+kqDbOKaOru33xhR8ZXJKnzjSf0ZxyZOaUBi8ZPXnmRA0uh7pI
 Ob3Pikcj7882WpR8UmbL5CLVvxmBtU/9e6ZM2b+kb2Xo7hM5PCo394TeZ2pT8hUV3rSR9+Xs
 a9mmO0VO8qxbMulz34mko5+VWIozEg21mIuKEwHamc83eAMAAA==
X-CMS-MailID: 20240912155339epcas5p4d1a3fcdb4c2e159b08c1b93a58654532
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151052epcas5p48b20962753b1e3171daf98f050d0b5af
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151052epcas5p48b20962753b1e3171daf98f050d0b5af@epcas5p4.samsung.com>
 <20240910150200.6589-4-joshi.k@samsung.com> <20240912130146.GA28535@lst.de>
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/12/2024 6:31 PM, Christoph Hellwig wrote: > On Tue, Sep
 10, 2024 at 08:31:58PM +0530, Kanchan Joshi wrote: >> This is similar to
 existing F_{SET/GET}_RW_HINT but more >> generic/extensible. >> >> [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1som8o-0007ke-5j
Subject: Re: [f2fs-dev] [PATCH v5 3/5] fcntl: add F_{SET/GET}_RW_HINT_EX
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

On 9/12/2024 6:31 PM, Christoph Hellwig wrote:
> On Tue, Sep 10, 2024 at 08:31:58PM +0530, Kanchan Joshi wrote:
>> This is similar to existing F_{SET/GET}_RW_HINT but more
>> generic/extensible.
>>
>> F_SET/GET_RW_HINT_EX take a pointer to a struct rw_hint_ex as argument:
>>
>> struct rw_hint_ex {
>>          __u8    type;
>>          __u8    pad[7];
>>          __u64   val;
>> };
>>
>> With F_SET_RW_HINT_EX, the user passes the hint type and its value.
>> Hint type can be either lifetime hint (TYPE_RW_LIFETIME_HINT) or
>> placement hint (TYPE_RW_PLACEMENT_HINT). The interface allows to add
>> more hint add more hint types in future.
> 
> What is the point of multiplexing these into a single call vs having
> one fcntl for each?  It's not like the code points are a super
> limited resource.

Do you mean new fcntl code only for placement hint?
I thought folks will prefer the user-interface to be future proof so 
that they don't have to add a new fcntl opcode.
Had the existing fcntl accepted "hint type" as argument, I would not 
have resorted to add a new one now.

You may have noticed that in io_uring metadata series also, even though 
current meta type is 'integrity', we allow user interface to express 
other types of metadata too.

> And the _EX name isn't exactly descriptive either and screams of horrible
> Windows APIs :)

I can change to what you prefer.
But my inspiration behind this name was Linux F_GET/SET_OWN_EX (which is 
revamped version of F_GET/SET_OWN).

>> +	WRITE_ONCE(inode->i_write_hint, hint);
>> +	if (file->f_mapping->host != inode)
>> +		WRITE_ONCE(file->f_mapping->host->i_write_hint, hint);
> 
> This doesn't work.  You need a file system method for this so that
> the file system can intercept it, instead of storing it in completely
> arbitrary inodes without any kind of checking for support or intercetion
> point.
> 

I don't understand why will it not work. The hint is being set in the 
same way how it is done in the current code (in existing fcntl handlers 
for temperature hints).

>> --- a/include/linux/rw_hint.h
>> +++ b/include/linux/rw_hint.h
>> @@ -21,4 +21,17 @@ enum rw_lifetime_hint {
>>   static_assert(sizeof(enum rw_lifetime_hint) == 1);
>>   #endif
>>   
>> +#define WRITE_HINT_TYPE_BIT	BIT(7)
>> +#define WRITE_HINT_VAL_MASK	(WRITE_HINT_TYPE_BIT - 1)
>> +#define WRITE_HINT_TYPE(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
>> +				TYPE_RW_PLACEMENT_HINT : TYPE_RW_LIFETIME_HINT)
>> +#define WRITE_HINT_VAL(h)	((h) & WRITE_HINT_VAL_MASK)
>> +
>> +#define WRITE_PLACEMENT_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
>> +				 WRITE_HINT_VAL(h) : 0)
>> +#define WRITE_LIFETIME_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
>> +				 0 : WRITE_HINT_VAL(h))
>> +
>> +#define PLACEMENT_HINT_TYPE	WRITE_HINT_TYPE_BIT
>> +#define MAX_PLACEMENT_HINT_VAL	(WRITE_HINT_VAL_MASK - 1)
> 
> That's a whole lot of undocumented macros.  Please turn these into proper
> inline functions and write documentation for them.

I can try doing that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
