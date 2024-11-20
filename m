Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D419D33CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2024 07:52:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDeZQ-0001Fq-0u;
	Wed, 20 Nov 2024 06:52:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang1@xiaomi.com>) id 1tDeZN-0001Fh-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 06:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JMByKKYj1XwZut7/0zIV5uOB2yI2LI8IyzPBfs2M/rs=; b=hzN0c/FybAE8D8TgvN8RXqotl0
 +NYmHsABKfYibh1XoWfCfM8vsiSZZjjhBe7to8G+2W3nEQVq0gWDt1HqKSOIyzQxCtYGPW7joBsA4
 briDGKo7SKl7MMsC36+i4dZD6EOW03iOqUQakj/0nQJHHSVNqCRM8ZPMXa/yCTzRsE1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JMByKKYj1XwZut7/0zIV5uOB2yI2LI8IyzPBfs2M/rs=; b=IwLNwi9OAiAMN4xtffDFRoeelK
 lW2IHqHVHIC53F0CSazXR4Z4qxQh+N2AA/upmUyEH1HvEqVxbHvXhW0OeSZU0ZW1hBY5vfZ3D1eTl
 5sz+Bhh+DNBb/IBFgNMOTjz7Zwsfo5mWjKDh3va8z+VgMCvcxxRO1T+LysFlaZkDgk/8=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.122])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tDeZM-0003uG-RN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 06:52:09 +0000
X-CSE-ConnectionGUID: RLdEhslOSZ6NFDb4kH/8DQ==
X-CSE-MsgGUID: h+obYzy6RZKVIEilZE1ORQ==
X-IronPort-AV: E=Sophos;i="6.12,168,1728921600"; d="scan'208";a="126934466"
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Nov 2024 14:51:48 +0800
Message-ID: <20241120065148.3280424-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <6ad6a7a4-d5a5-416c-8340-5611fee79c0b@kernel.org>
References: <6ad6a7a4-d5a5-416c-8340-5611fee79c0b@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.11]
X-ClientProxiedBy: bj-mbx09.mioffice.cn (10.237.8.129) To bj-mbx11.mioffice.cn
 (10.237.8.131)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 2024/11/11 12:31,
 zangyangyang1 wrote: >> f2fs_find_data_page
 is used to find dentry pages, >> I think we should cache more dentry pages.
 > > Hi, > > Did you suffer any issue w/o this change? Hi, No issue encountered,
 I just think that dentry pages are more important, so we can put them in
 the active LRU list in memory to avoid being recycled. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.226.244.122 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.226.244.122 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.226.244.122 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tDeZM-0003uG-RN
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache more dentry pages
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
From: zangyangyang1 via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zangyangyang1 <zangyangyang1@xiaomi.com>
Cc: zangyangyang1@xiaomi.com, jaegeuk@kernel.org
Content-Type: multipart/mixed; boundary="===============1167465318883504043=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============1167465318883504043==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

> On 2024/11/11 12:31, zangyangyang1 wrote:
>> f2fs_find_data_page is used to find dentry pages,
>> I think we should cache more dentry pages.
>
> Hi,
>
> Did you suffer any issue w/o this change?

Hi,
No issue encountered, I just think that dentry pages are
more important, so we can put them in the active LRU
list in memory to avoid being recycled.

Thanks,

>
> Thanks,
>
>>
>> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
>> ---
>>   fs/f2fs/data.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 402e00d54c0b..71ca987fe7cd 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1286,7 +1286,7 @@ struct page *f2fs_find_data_page(struct inode *ino=
de, pgoff_t index,
>>          struct address_space *mapping =3D inode->i_mapping;
>>          struct page *page;
>>
>> -       page =3D find_get_page(mapping, index);
>> +       page =3D find_get_page_flags(mapping, index, FGP_ACCESSED);
>>          if (page && PageUptodate(page))
>>                  return page;
>>          f2fs_put_page(page, 0);
>> --
>> 2.43.2
#/******=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0=D0=A1=C3=D7=
=B9=AB=CB=BE=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=B7=A2=CB=
=CD=B8=F8=C9=CF=C3=E6=B5=D8=D6=B7=D6=D0=C1=D0=B3=F6=B5=C4=B8=F6=C8=CB=BB=F2=
=C8=BA=D7=E9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=C6=E4=CB=FB=C8=CB=D2=D4=C8=CE=BA=
=CE=D0=CE=CA=BD=CA=B9=D3=C3=A3=A8=B0=FC=C0=A8=B5=AB=B2=BB=CF=DE=D3=DA=C8=AB=
=B2=BF=BB=F2=B2=BF=B7=D6=B5=D8=D0=B9=C2=B6=A1=A2=B8=B4=D6=C6=A1=A2=BB=F2=C9=
=A2=B7=A2=A3=A9=B1=BE=D3=CA=BC=FE=D6=D0=B5=C4=D0=C5=CF=A2=A1=A3=C8=E7=B9=FB=
=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC=C7=EB=C4=FA=C1=A2=BC=B4=B5=
=E7=BB=B0=BB=F2=D3=CA=BC=FE=CD=A8=D6=AA=B7=A2=BC=FE=C8=CB=B2=A2=C9=BE=B3=FD=
=B1=BE=D3=CA=BC=FE=A3=A1 This e-mail and its attachments contain confidenti=
al information from XIAOMI, which is intended only for the person or entity=
 whose address is listed above. Any use of the information contained herein=
 in any way (including, but not limited to, total or partial disclosure, re=
production, or dissemination) by persons other than the intended recipient(=
s) is prohibited. If you receive this e-mail in error, please notify the se=
nder by phone or email immediately and delete it!******/#


--===============1167465318883504043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1167465318883504043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============1167465318883504043==--
