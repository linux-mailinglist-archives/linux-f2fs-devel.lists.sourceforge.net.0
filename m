Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC9377EAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 10:53:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg1fe-0005sP-W5; Mon, 10 May 2021 08:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dwoo08.lee@samsung.com>) id 1lg1fc-0005ro-MO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 08:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ta4Dm/q0ATPaje27rRnRdvcFJIVfMD4j6XuPWK4TeHw=; b=OmFJ2umwTIc/V4kvahKbBWlj/Y
 XiSIM+pXhM8mEDg415KZowvYTcPndiZcSDEgxXqyLYHhV73sz3qsK88EEszrzw0qm+kOpvb5SGCC1
 T2c+RoBxDhraGWTFtcU1D3pLshSXvssbTj2e5hXKK0TqeY1hIWpGn8YpFNe8pZOjWaaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ta4Dm/q0ATPaje27rRnRdvcFJIVfMD4j6XuPWK4TeHw=; b=gvyfWIZfcfTcVu+fZty3p1gJqN
 HO6MSxasqcN/ZSVe0WpjAVbrSJ5kK2QCavBU2RwcijBybcABmLgBjy6NI0OxtuXBLj5Y6kHShRSBe
 37UWbxNofbJvTsch4PQ7Utg240JLla437piQ+GcpcU3TiZCkHLPYDO1652diH01vEa9Y=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg1fY-000wbQ-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 08:53:46 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210510085330epoutp0223de7c31d4563cb41257e124fa0ba6ab~9qJe22AOT1699616996epoutp02K
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 May 2021 08:53:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210510085330epoutp0223de7c31d4563cb41257e124fa0ba6ab~9qJe22AOT1699616996epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620636810;
 bh=ta4Dm/q0ATPaje27rRnRdvcFJIVfMD4j6XuPWK4TeHw=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=MI6WO8CKSOSGTyqLhWnvLqz2tJP3sUYyfRSF/n8RMc5ip9f9h7BOrZkG3G6m2AEX6
 pctSLku3VWk6f0/nFgNu0BCtB1Cn67zne52deq04653dx9HX0wdxN0gAv/0Q/jw2uU
 CgPRLSIkYsE1XaSW5GqJTRDcGgIoUAABX50O4x5A=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210510085330epcas1p37d3cd08fb6bed2bef8e50892b6724264~9qJesWk_63097930979epcas1p3I
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 10 May 2021 08:53:30
 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4FdvwR4jHCz4x9Q9 for
 <linux-f2fs-devel@lists.sourceforge.net>; Mon, 10 May 2021 08:53:27 +0000
 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.4D.09701.784F8906; Mon, 10 May 2021 17:53:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210510085327epcas1p4ea9be251f9412deb74d3d796e9a786db~9qJb0L-lC2312723127epcas1p4R
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 10 May 2021 08:53:27
 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210510085327epsmtrp1d186014d7acc36426d722e36d65cb6af~9qJbzlRO72227022270epsmtrp1x
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 10 May 2021 08:53:27
 +0000 (GMT)
X-AuditID: b6c32a36-631ff700000025e5-57-6098f487341b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.19.08163.784F8906; Mon, 10 May 2021 17:53:27 +0900 (KST)
Received: from [10.113.221.208] (unknown [10.113.221.208]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210510085327epsmtip287ed63a2b61874bf02d8c05dbd049a9c~9qJbrbl0q1622916229epsmtip2M
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 10 May 2021 08:53:27
 +0000 (GMT)
To: linux-f2fs-devel@lists.sourceforge.net
From: Dongwoo Lee <dwoo08.lee@samsung.com>
X-Forwarded-Message-Id: <e568ad5e-5768-648a-eb4f-ca80b0c68743@samsung.com>
Message-ID: <1089945e-41f2-76f7-f2d7-d79ed9422c3e@samsung.com>
Date: Mon, 10 May 2021 17:53:28 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e568ad5e-5768-648a-eb4f-ca80b0c68743@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmrm77lxkJBq8vqFhcWuTuwOixe8Fn
 pgDGqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCh
 SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCywK94sTc4tK8dL3k/FwrQwMDI1Og
 woTsjA3X7rAWrOetaJp2j6mB8RFXFyMHh4SAicT2Do4uRi4OIYEdjBIHTk1gg3AWMkl8/zWR
 BcJZxCSxd/80pi5GTrCOtVfaGCESuxglDl+dyAiSEBKYxyTxeoEEiC0sYCWx/ec+dhBbREBL
 YmLDX0aQdWxA9v5fxRCbvSSuNySCVPAK2Ek8PnmADcRmEVCVaDkBYYsKREi8mL+cDaJGUOLk
 zCcsIDangL3E1LM/wOLMAo4Sfx4fYoWwxSVuPZnPBGHLSzRvnc0McfI+dol9p/gg1rpI9L+2
 gQgLS7w6voUdwpaSeNnfBmVXS/Rf2M8K8qGEQAujxNuOaywQCWOJ/UsnQ4NBUWLn77mMELv4
 JN597WGFmM8r0dEmBGGqSDR/ZIYZv+79P6gpHhKT3s1hncCoOAvJY7OQPDMLyTOzkDyzgJFl
 FaNYakFxbnpqsWGBEXJMb2IEJzYtsx2Mk95+0DvEyMTBeIhRgoNZSYRXtGNaghBvSmJlVWpR
 fnxRaU5q8SFGU2BYT2SWEk3OB6bWvJJ4Q1MjY2NjCxNDM1NDQyVx3nTn6gQhgfTEktTs1NSC
 1CKYPiYOTqkGJkWuN+f397z+ZmZ+a/dNtQnzsmzeJxSXfv7wItrh013/grlNFWmL72bNV+g1
 7vn1ZT6zGq/9tfzbbXyPDug+/Bn5tbL0mOSyULM+y84Luiev/7IrbLx5/8x2pRnXHRaw7m++
 dymgoS/q03170cKJxgER/lUbk3kU05cxb5gz85u1YmTRHMW/zUGHRXd8VLwxNYNXTe3LH3lV
 fk5xhjdL044e+i9bJnneXrJ2xZ2MzM5k68e3dh+9+VVZYbqp7zSBfiN/8Qeh9emi37MWJteI
 1nCLe06c3uXt9jriyvXNHy6nZvvaPFjHkuzUd2Prh6WHSiKd95VMvHnw44WbPQFfSzRW/V0Y
 cfGp/87D6k9DFyixFGckGmoxFxUnAgDGw9EF9QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSvG77lxkJBpNeclhcWuTuwOixe8Fn
 pgDGKC6blNSczLLUIn27BK6MDdfusBas561omnaPqYHxEVcXIyeHhICJxNorbYxdjFwcQgI7
 GCXOb9nC0sXIAZSQkvj3RgDCFJY4fLgYomQWk8SsC8/YQHqFBawktv/cxw5iCwnYSayf1M4I
 YosIaElMbPjLCNLLBmTv/1UMMcZL4npDIkgFL1D145MHwKawCKhKtJyAsEUFIiQWTF7CClEj
 KHFy5hMWEJtTwF5i6tkfYDXMArYSd+buZoawxSVuPZnPBGHLSzRvnc08gVFoFpL2WUhaZiFp
 mYWkZQEjyypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOBQ1tLawbhn1Qe9Q4xMHIyH
 GCU4mJVEeEU7piUI8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvE
 wSnVwHTm35VkN+/6fRvqWtr+WUbc/hr4JlHm7MsjFX1eDHETVhxU4ROukqtcXzGz8Nfkl1fu
 icsFPj/z9utf1U/b/1tc23R6xYv+5J1zzPP6mBRbNn81vsXtzr7Tcskl2W8+fb+am8ob5bou
 lB1znCL+8eqODwe83+kwTdsYeXAJ2ynFefoPPq2aM+X1H1PLXNY1+5e/efD+6K45dxaJ1Fvt
 f/In7Lnez4dBB8SfWZ5RFdD+XPeyU4ypmm3PE4m5P66d3+fSPvHZE6tTGdy7GG+5G8xgF50n
 JFk3I8LD/lr9Fds7Ii9Vtt/n5FktdviTqNJDlXf3M3hrDYr10ucmrtnx4rO58yWh3l9Wr4U7
 X/O+PLDLUYmlOCPRUIu5qDgRAMxQwqLUAgAA
X-CMS-MailID: 20210510085327epcas1p4ea9be251f9412deb74d3d796e9a786db
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210510085327epcas1p4ea9be251f9412deb74d3d796e9a786db
References: <e568ad5e-5768-648a-eb4f-ca80b0c68743@samsung.com>
 <CGME20210510085327epcas1p4ea9be251f9412deb74d3d796e9a786db@epcas1p4.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg1fY-000wbQ-Fh
Subject: Re: [f2fs-dev] [PATCH] tools: Introduce f2fslabel
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/05/2021 15:28, Chao Yu wrote:>>
 >> +static int verify_sb_chksum(struct f2fs_super_block *sb)
>> +{
>> +=A0=A0=A0 if (get_sb(checksum_offset) !=3D SB_CHKSUM_OFFSET)
>> +=A0=A0=A0=A0=A0=A0=A0 return -1;
>> +
>> +=A0=A0=A0 if (f2fs_crc_valid(get_sb(crc), sb, get_sb(checksum_offset)))
>> +=A0=A0=A0=A0=A0=A0=A0 return -1;
>> +
>> +=A0=A0=A0 return 0;
>> +}
> =

> How about reusing existed verify_sb_chksum() to avoid duplicated codes?
> =

>> +
>> +static void update_superblock(struct f2fs_super_block *sb, int sb_mask)
>> +{
>> +=A0=A0=A0 int addr, ret;
>> +=A0=A0=A0 u_int8_t *buf;
>> +
>> +=A0=A0=A0 buf =3D calloc(F2FS_BLKSIZE, 1);
>> +=A0=A0=A0 ASSERT(buf);
>> +
>> +=A0=A0=A0 if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
>> +=A0=A0=A0=A0=A0=A0=A0 set_sb(crc, f2fs_cal_crc32(F2FS_SUPER_MAGIC, sb,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SB_C=
HKSUM_OFFSET));
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 memcpy(buf + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
>> +=A0=A0=A0 for (addr =3D SB0_ADDR; addr < SB_MAX_ADDR; addr++) {
>> +=A0=A0=A0=A0=A0=A0=A0 if (SB_MASK(addr) & sb_mask) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dev_write_block(buf, addr);
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ASSERT(ret >=3D 0);
>> +=A0=A0=A0=A0=A0=A0=A0 }
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 free(buf);
>> +}
> =

> Ditto,
> >> +
>> +int main(int argc, char **argv)
>> +{
>> +=A0=A0=A0 if (argc < 2 || argc > 3) {
>> +=A0=A0=A0=A0=A0=A0=A0 fprintf(stderr, "Usage: f2fslabel device [newlabe=
l]\n");
>> +=A0=A0=A0=A0=A0=A0=A0 exit(1);
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 f2fs_init_configuration();
>> +
>> +=A0=A0=A0 c.devices[0].path =3D argv[1];
>> +
>> +=A0=A0=A0 if (argc =3D=3D 2)
>> +=A0=A0=A0=A0=A0=A0=A0 print_label();
>> +=A0=A0=A0 else if (argc =3D=3D 3)
>> +=A0=A0=A0=A0=A0=A0=A0 change_label(argv[2]);
>> +
>> +=A0=A0=A0 return 0;
>> +}
> =

> IMO, this can be integrated into fsck/main.c?

Sure, it would rather be simpler than this and duplicated codes would be =

removed accordingly.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
