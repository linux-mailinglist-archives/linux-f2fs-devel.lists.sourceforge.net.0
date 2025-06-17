Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AAADC1B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 07:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBkWmHlI52H25KXUpNeqYC358Z+IiFbdWTqvzpuwgV4=; b=jRv5IeU13mA3NXI1XYdC7QzU7D
	qS9oEuVszETZmj2q1b4r+r2bIkuNbyevn6w489xSFOF839+oGLqhbZ9JMLXGX8H7kphWNVZ+uAER9
	n6hY7j7I5AfNQIpfR4JVMljniXgp46rxWb7Dz3zw4B8ES50oLUsJ8D16wa0HFHCvJqYE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uROun-0002Cw-2f;
	Tue, 17 Jun 2025 05:31:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uROuW-0002CQ-SV;
 Tue, 17 Jun 2025 05:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ROdNidelrgrpRvtHdRtJfh3Pgoc7JLVdnxJhjlsbT14=; b=FSKD54cPQLdHs13a64aE60ABLh
 2NbD7pjflNSs9eaFWOSAGBNE81cFUu2uAzYcue6haECw/70DjVIn65ofmR1XtafLwER09/mbz6THB
 S2Bx2Ojw4/eOzdDRsk1UgvHPrpIUPMC7H0fLIEoBitktFkNYu3S/3O8CGWtn8NdDLQWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ROdNidelrgrpRvtHdRtJfh3Pgoc7JLVdnxJhjlsbT14=; b=KghntM2KIVF2fh8E8xyg0jMz2k
 XHH/p8wAGQhl5HiwGfcFcSY8QWQ1CECRja1E7kR+YK03ZZAS+SN9oeGi8pqXBDkqNii6hdRgZFD/A
 /dq7pJvKL7p5HuhV7744zzTZUCkaslc4QcobDAtyH6EidJsjY93TDMKLKy4eeqn6Ux4w=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uROuW-0003ZT-82; Tue, 17 Jun 2025 05:31:04 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H0iurG017362;
 Tue, 17 Jun 2025 05:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=ROdNidelrgrpRvtHdR
 tJfh3Pgoc7JLVdnxJhjlsbT14=; b=qlZsnJujiUbKhuhGUFVb2xVkOENd1q2eim
 6T5NMWPvOI8icPvLF6mWjhDeeZ2sy2LZM73lLvOofMys5ga5t8aQEdAD34GU3p44
 Ddjywsw4OXVzsXgqa+jEuUlprlhVtpljY3SgabhrRgCe73Nwu78cJstoz5lzfMJh
 lkg/FgGGaTYHdwATDL13iadgm97HnzF4hSeExpszOYw+9+Et5C1Yd8g4uRAbP3ql
 L3gczGUanL8XWKyvgZ347lf6e3//YsorxUHeMHGhTEMR50NdVfy0ZOFwStv9BO5Z
 HzxfmpNH8XhRhS31TY7GXq2KknWmR24a3W/+iNfmLfReA91VY5tg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914emgjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 05:29:54 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55H2OL2G001502; Tue, 17 Jun 2025 05:29:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yh8sjn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 05:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtveZz32bFuSly1d9yXY6SfUc8F1Q1pcRQBdOtLSxXSva3GzQpvbts6Me0uXonC0GqNsqwqIuUxr/CIZMVOvXrudACOqQ/IW/ZBkPLpyjQr+II7xlRXdqFVS/dswI00xSrOCcIDh30rlnjunVQYSCZHmjLOEJi9Rk0S9iR681waI+HfJfIbI+0F0N596ZLTKYU6hR0382VV64aL3qVC/pPlY9hD5kP55lqCZQIH+2lmvFFD3Y0x8PDCKDKu0b59ESukhwwPOSV3jxfGyscdZoK8AItepdAsd1D8FpxF4wLGurKIW043dk/P2x790zBqq5Scx/AmBUBww76SSk8Wukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROdNidelrgrpRvtHdRtJfh3Pgoc7JLVdnxJhjlsbT14=;
 b=yhK3EGaCfBAJvgm08W4Pjre8f1BC/WiakC7tMuPPdwL5hhUHy5dwc/LM8wxNtfbctARmJRT2VHNEt1/UmFwxEVwrOu/dI/4aMpN4s8Q2bUL3Mpn9EV5OTwI0jn3L+JhUs1Oe3If7uJrNOgfIwGAnqcqqOq8jpNVgcoAP8HRvoXoOTPGPk2ZgbQ9RvF+cV+eFAsdkR9CzgjBNm6G4VXgCHaYC2nry18NLzpVBZr0vMC82KyHnIO/71k/gRMl0KJLYJOU1Aib50n70EM9YYSyzpSaZ8XVXoSnpG3in0QYKDihVmzZeiHO/onfLrXVPxC7Z4uqItqVmENorNv2gkQtS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROdNidelrgrpRvtHdRtJfh3Pgoc7JLVdnxJhjlsbT14=;
 b=jkmlhMf+FybnE04238lDIIO186NXnNBl2iD7XAi2whyHTR+iJ+9aZ4ICGEl8Fg5CpUcnPybKZnPqKQGClllAIhQcgoNB/vupZnSFEXF6HegKWZX56WA+i9ixeWeweb9M6Zb0sIrE8E6FhkPk46nJ5yKnbzp+CLNoXdag8StkGa8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5719.namprd10.prod.outlook.com (2603:10b6:a03:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 05:29:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 05:29:49 +0000
Date: Tue, 17 Jun 2025 06:29:47 +0100
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <de93f95f-c90e-4bae-a1e3-150fb91c0c07@lucifer.local>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <8d389f4994fa736aa8f9172bef8533c10a9e9011.1750099179.git.lorenzo.stoakes@oracle.com>
 <aFD4xtpot22xvTEq@infradead.org>
Content-Disposition: inline
In-Reply-To: <aFD4xtpot22xvTEq@infradead.org>
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 427bfea2-f44a-49de-8c2a-08ddad5ffad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t297ZeE+Qt0oPxY5uERLDtBA9evkzi6J3a1NvKaVmpnOYuWiZ94JKDNZoT5+?=
 =?us-ascii?Q?3hEnWslTkZgI1V52T7ckhkcMDiioC3I0ZzaU7XDg8EWLU2QA9EMinW4/VDbd?=
 =?us-ascii?Q?f1zzbZRofu7RvKOicotXbKfxtO4NKmtfuR3DV5OrLOoEQ5OWrUYA7qxjhIt5?=
 =?us-ascii?Q?e94TV9+zYhmm7fKXs103jO4tOHI5vpnZCtdPoDnFuE0bSthVbDP5qeh7VcAH?=
 =?us-ascii?Q?FCD8XYJ6gLuOp8D7na4BHIuzDDZFHZyynLlFXXQR/yjQzaN1OTzBO6MzmvFk?=
 =?us-ascii?Q?oI/IIu05t7ycnB5bBku0piNIGCqnyjWeHskMJlKl5DABbhuf9XuKDB70iql5?=
 =?us-ascii?Q?8QUV0hSMbiCxOz2RG89Ga4Xl1IP55nJ1sMMZluGDkQ84LQP4Oe4Tuiac64my?=
 =?us-ascii?Q?+oP58VMwHgLUBbhYLJGTEi4SlicVuSHvBsskkAAQvuzEs2Jnt+oMB0y7svqc?=
 =?us-ascii?Q?/5+H/vIK99xIFETAnJZjmDHhteHZ2sEI5vmaKJPfyqjljWFuwZFMLk8Ew3p7?=
 =?us-ascii?Q?ol3SkW7X7oXZk1OGMRW1AO6FGluJJOjvNeqzEZ6L3pIRq0OAyzddXZ1YtcPs?=
 =?us-ascii?Q?AG0A1p1+Htd0g9PHIuZHk/xTXhzq5h2IIjHxb+O6L1zTqtHs7Fcz0ZzrHS+x?=
 =?us-ascii?Q?zR3MJ97fQCwtbovwwoBChE/0mOFylK/3/BBEU5p5ktLqaSP5FzdTLQbPK6mq?=
 =?us-ascii?Q?uzhYbQSLPN7gngN80h7Y4GRMBbQMFEUWJIYDbN0lnlnR3+FK5H4HnvDKLVQp?=
 =?us-ascii?Q?YfI0FlQhpMDS2fU9U4fl6iawllmDeQOeQ93K6OYJDXlkP61Z0TXKcAfjX+XL?=
 =?us-ascii?Q?askDIZ3/jsbWJPypx2SwU2fcJ6LYY+kbnbh8NeGUShALA8wyG8TzJYhdPW1G?=
 =?us-ascii?Q?6ZSVMHkkCL4W0dOvZNXwgG8by4N6hdRpWK8QOwfD0mJhE58WBImgyZY5ucN9?=
 =?us-ascii?Q?d4TL1/uBjWjg3IaI5cIXJECkOlxF7q+WpZosjWnwh0obwfeMeQ7FGdFYje7D?=
 =?us-ascii?Q?uSl5+2GWnqwiQx6w3eqdcU0vAjSYX0XM2D7h6HNi980qUW2mQTy9OGa+2NmL?=
 =?us-ascii?Q?TE1uT50okpJkR+y6+PPHuvjqi9d1LA//3Ffb00ghaSrFP472w/rhzFxO8Jkb?=
 =?us-ascii?Q?GCAFnVwhyKR8KyG2iNjhzBHYRjLlLvwT8sjygvYjLMp3YulptTca0KeF8Qqd?=
 =?us-ascii?Q?RhpYdIqwjN8a3DVneghahhiX/w1fdpEthmpr8yx6K6AmY+f+MRmEefd0emA0?=
 =?us-ascii?Q?qHUd4FliV0ONvALafP4btnv4Pw6xAlE1JjPWdqksDyDdM/Iiq0XCrfL0tlx6?=
 =?us-ascii?Q?GX0mnn6cHdg7srEEMOqB45UgPvFtMujpS96bugJ+BI38HtLEFf317am1Jjms?=
 =?us-ascii?Q?nTp/eGWREhWBluM4FJUEPA+bMxoB3Nw2yQSLtFj8PQqATnIvOXoNvzDsNypm?=
 =?us-ascii?Q?Fs8U9H8M0mQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NhoO+3UrU7CIEq/OAPy+x/H5GIBVC/otiH5AqoPa+dy3MhswWxcQwdyDmZ2p?=
 =?us-ascii?Q?l9w/Kyf2mxLhW3w0X2EmOKq2w37QBA59HvSJ6c8CCwDFqH5u53hX8WyrKXNf?=
 =?us-ascii?Q?uTHrv0NvQAZFeE7DvKKnikIuLugfX1sCvPHnoQJzgRRx7iJvNcAA/caKUIns?=
 =?us-ascii?Q?opKSHcnOa8gL2Ec7sp2cWwznuVOJbg9p+dG5hpNjK6P1Bf8Q5NmKBjof7MgT?=
 =?us-ascii?Q?d135sAWj+11WqbbJ14D4a20aD61KfA+ONWe2ZsNv1NtGzj1QOeWzT7Xh0QZE?=
 =?us-ascii?Q?oF+rh0c2Ufya4cvTZ5QD/lMHhrGctVdb4alKkmwDaj/7dwQP/NFn0GdrkoJ9?=
 =?us-ascii?Q?4p71PMBrzoqrjh81TXYq8K3tcj1Mx2sEzGbEQVoLyrRP5M7BguSXVTeP83Jo?=
 =?us-ascii?Q?RYINiiYm3OcX+X/s7PCubQYn24FLti64IfI5fi+m0njzJ95HggYcGLTY6so/?=
 =?us-ascii?Q?GOyXOGGWX3PwN44ddg8l3L+EcVgmrwQHugM39V84p1Lle1tWTKAozRmRcsMQ?=
 =?us-ascii?Q?PfI33a827T187X82Ev2lmb92XoVv6ywcQPNF9RFz9cduM2ysFZVtY2zcJRKK?=
 =?us-ascii?Q?u1uLFSjM43Ojxmhfc/9ze4FZn1qv7vpC/12LtD/yVbMECIzQiuiyp8kEQhF+?=
 =?us-ascii?Q?YfOcM4N36EoEHRTj9O1PmZuPvmXokfplqUHqCGo4louiJNflAi82dr+FKA6A?=
 =?us-ascii?Q?XRgda3dSFOmAbhx6j/5ZpWlp3IsK6lf3ew4mh4v22ARaEyHb+ncCF5GUBz1M?=
 =?us-ascii?Q?oCqxMSW8OSZ2PDkTjatvf2CeYW6NU5iSaX3pnjmvIDt4q9ea+jYI8t90bqg4?=
 =?us-ascii?Q?zaGx4FVdIunyeeCdts0I6LlKME4BMlbdma9o/OOG9WoujQuB75LBcUYc6rkA?=
 =?us-ascii?Q?sp3aWgHet72zE1Ol23flotfWIOm6SoQF2aH90nKSpBezK6B8hNca4j0Nxxqe?=
 =?us-ascii?Q?pg90m0H0NQummZP4H2XxIIONwsXuPvbqehcCmQXzJVDZmUbGVS22poDAEabR?=
 =?us-ascii?Q?T4ADg0+fFXsKYoG0w63G7c8JmBSwY2QZC6sd6IOYQ0FXIx6pS47YuhRjOhLE?=
 =?us-ascii?Q?hm/DSHn9sFDKQxGd2KByyjMEeP6l+1xNQoVloT1uRyWSl3/57f8pBkbfvLwO?=
 =?us-ascii?Q?haHCHi2M/vxOCRFPK2lf4PGYqLYPcnoCZTfu1Q1+eRXwv1fpHpWMeTPgjfFf?=
 =?us-ascii?Q?ilxyP28XxkRpTrLS4qGVVNIzNgtdpK+Txky9FdqvNsF6Ri89y24aXYbu+x3T?=
 =?us-ascii?Q?aBdkvnQjaILt3BT7hA2SYWhLT8HATL16LNxJIaLJepPnvXKjc9hB3iny6USH?=
 =?us-ascii?Q?wzuuZ/+JfwymiroWQZkpUC96bWjoLzPGGRtPVp2WM4/nXwvdD0rE0JdDhqrc?=
 =?us-ascii?Q?k6Rf6pAAiRd0ptBGy2NNewCoTP/qPt0hzYbH3R6jQnpMRsuKJIbEUeLkYRAh?=
 =?us-ascii?Q?FeAnZO+hyajBRrA46mt85qRTxiJWj/It2wwJ+kkcZ4JQ63F4cAJX21sNvGZE?=
 =?us-ascii?Q?Qd4j7LB4bFfXket0vtXTzm4vET0SDY/X39ERfqRZ+5JZiUKHQsrmgdTTKqeR?=
 =?us-ascii?Q?E8uWgADf+ur4B/maKIFUWHVFuKGHE7kMYPYM+LXqYuqlrCJeiFMnjkTEkVVJ?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PmvzkoCDcq4B2dj4qIGgDe+ZGukn8XOEap9n6vPA8EP9COYZ2DVAcJgp0uQH/GxmMVUvpkEFf+073+MxiDY+8Uuv/7Kh+iPICp0KNEFENl2PvmM7BoR/HEubygpqPej8yDEs5UyZxhLguapoojx2FP6B0W11pQLiOXP09xzO7YCl0f84MObfqrTMogC7L9xP0jfcmZ0Qrqdsx1kJk+U6gn2keQBaKWLYXbnBxMDMN7/gMpoZAN1HE79zsTArzcCMH6k/lzfBg+oOABENDL9vEdhdyHHS2qYgBTQyk7uFrDwjXnhVunhiepXDQEcFnnYJHYBrDNkSOnwp69EB45NNLSIVfVrRQOXSrBOSMF6x7wtN5EqmDXjO6FAkz0aVHgVhadVkQ1jDpt+VvEuG+y5tzNP8A7XOa1eS182/kY3u/liKkh4dm9yf3jtashlBiZBtRCJj7ckcm6U0fzSEVcTS1SXAdPe0jpj5s/170qjJKfP3ssy74v4gVv+Lf1/YHgnkNlJpHaB9Ui5TtTqmuGjf2koTiOP233yJiPLnjmZalikdVhKDcKbtAzR5ggukOMOuafL+K3v1oCdZ7qFYdR1AiezMpoR6VGfuejl/OnM0BL4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427bfea2-f44a-49de-8c2a-08ddad5ffad1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 05:29:49.8793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUDBM99dexTVhNRyq6BCSdwGRV7f+gw25HH5FpCsFFa47M35UedAOzes2QtmnOa1I0kEOsP0MvOcoTVMtvYkH0CH9xN6WfpGtBreiOcajF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5719
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170043
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA0MyBTYWx0ZWRfX5DeODN+lGaW7
 5L7TGCs43qZoPBZ0X2o7rA975HvXn87HLc8kqxWwAoAEJ1z/tjhkNN059g8qVxXgRnn3GhRrBw2
 1nq8llIWWBcYE1ntxR509pxkpahHz9BHI1nnKx62C9YUg0NZPlIh6oI+GRKiZe0T0W2Qn+uTPmn
 cKQ8WSke3KluG19/No7bfCT4L/UQXrf+u6rCOu/U6DJCKOMGaOUz6LigNPh+rh+s+KVcZvCiBbl
 7IuutV/x/c+OzJzMZWlxVGKMT2JkDijRyQUP2HWE1n9030T76ZxTBMNd961gd0tKZ8O/n3gF7d5
 9koD4E54ThRSS2XJGWYVG6c5C3Y+1Prk5y01kcvA9Eppk22STMBZYMOqS23CDkvsSlurndj/nlV
 tTV7v0jTw4vukt1Pp5TeuS7JAvhyuAqMtkPQAzKWpH2u84212JMWWzFyHZKn85Re5SDR9NAe
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=6850fd52 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=ga9ms1K9sbQnPafhHRgA:9
 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: qScwlbb7Zb7_uj7w6xPTuX6tuA8Rvp2F
X-Proofpoint-ORIG-GUID: qScwlbb7Zb7_uj7w6xPTuX6tuA8Rvp2F
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 16, 2025 at 10:10:30PM -0700, Christoph Hellwig
 wrote: > On Mon, Jun 16, 2025 at 08:33:20PM +0100, Lorenzo Stoakes wrote:
 > > The call_mmap() function violates the existing convention in > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uROuW-0003ZT-82
Subject: Re: [f2fs-dev] [PATCH 01/10] mm: rename call_mmap/mmap_prepare to
 vfs_mmap/mmap_prepare
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
From: Lorenzo Stoakes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 16, 2025 at 10:10:30PM -0700, Christoph Hellwig wrote:
> On Mon, Jun 16, 2025 at 08:33:20PM +0100, Lorenzo Stoakes wrote:
> > The call_mmap() function violates the existing convention in
> > include/linux/fs.h whereby invocations of virtual file system hooks is
> > performed by functions prefixed with vfs_xxx().
> >
> > Correct this by renaming call_mmap() to vfs_mmap(). This also avoids
> > confusion as to the fact that f_op->mmap_prepare may be invoked here.
> >
> > Also rename __call_mmap_prepare() function to vfs_mmap_prepare() and adjust
> > to accept a file parameter, this is useful later for nested file systems.
> >
> > Finally, fix up the VMA userland tests and ensure the mmap_prepare -> mmap
> > shim is implemented there.
>
> Can we please just kill these silly call_* helpers instead?

The vfs_mmap() function now has some actual meaningful logic added in
commit bb666b7c2707 ("mm: add mmap_prepare() compatibility layer for nested
file systems").

>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
