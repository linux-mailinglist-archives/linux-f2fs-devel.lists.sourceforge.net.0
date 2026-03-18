Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LQ5Ch4mumk3SAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:12:14 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944A2B5BB9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nmkmhsq34xppnsRf8140An736Zg1uw8SOkxBurXwjA8=; b=iXK0mUOmV3u5cRtj5KKEEN0M37
	ULZ1/o45yYaG8umDxtoAGnKSVf1OTyMsX95CiCU2Te5JDbv14fa5q6+Lqa0crfRggRjngvc+iAJN2
	zQkhougEXKNr1pp3R4kn/PHxwVBYXNM5Vo6pl24FrqddP5SlQMcDQ3NYC0hEtJS+L/Qs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2iGM-0003kb-Gn;
	Wed, 18 Mar 2026 04:12:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w2iGL-0003kU-6k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l7swa0tYJHOsVNIUTPS6EeYUIRVfH0uqpqjSeNRhWXE=; b=U9lD2nC9W4ONCpJtTx/FYEw3gu
 oO+jfSvSycmMYDPeGNaIl0953TTl+hmNVIrtxjsinxdQ6m/uWtxuaNriaQNhL3Bg2HIpYudKZ4C+I
 dyt8Ay0At1arxo3jZDQ98eJENEF/6rb7+eLksoWWPVx+1mQD4pv+FhA9np1ssy7E9QEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l7swa0tYJHOsVNIUTPS6EeYUIRVfH0uqpqjSeNRhWXE=; b=Wo8LgrjTkIQxsEP9dDsXv0x5us
 gwgThBJYl0nWUGtK8p0PI0rZXUpMP/eKLCkDO/8AjzA9k9VpTflODgy25TD72ITspLI/v0npy6iBJ
 xw82GG4SIGD1AlS1YLH8s1FkE0werTn68VTZrJnW83G/W9oJKmO18uTlFEvLcU60t/vc=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2iGK-0006Nz-Hk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:12:05 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I2NW9M1776835; Wed, 18 Mar 2026 04:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=l7swa0tYJHOsVNIUTP
 S6EeYUIRVfH0uqpqjSeNRhWXE=; b=qw2cYyhthcOOnsMI51Xn7O1p9FKKTysr0e
 yh8Rkxjf9cFM4IvnLR91Qgye9C+UadbTpgpIcJyLB2nU+RAtbmFdDzl29yyAdUXS
 JIDuCRXqA35duLOWZUuwv1KjXUNCvaQIuEI93rzV4guBQzAWP3bGo25Ih0avbuqO
 Hg4797aIodMD78B7dGQShmB7NrGHQFkpNruyrmD3oJdV7FkhcTWbWhgCOnpYPKd4
 mdTzsR2Qbs3HgITTKA0aB6IZqd30ZhCiqt7s0/koPVtIYlu3TC2Rx1KwWJ/6Qbkh
 7y7erUdYE2XjhFX8vhtRb/qkfC4RNUflnJV5zTBqeaE0VP2DumLQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxk8devs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2026 04:11:05 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62I17KU9003496; Wed, 18 Mar 2026 04:11:05 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4cvx4b2fs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2026 04:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okUUhiCaL05/+Tp+mTG1cnv/Y2YlqbMrF3730kp02w6c2dnpXSKgn6/ELm+4+B7WBMWjJU/7rkPnSK6E87BaUL1N98vRszxr68TNhOllr00TiKtEIbv+EQgqrTJhgjf4Xn76b7Xejz2bgYEvvA3pwMVkLxz3X7Irdikr+Tu0ITMtQxViGT3BB8AvVNTP2FvMw+eZb7cyltkx9XUFygHLHDWvfGoPmUMkbIdwDJGQzZAhti6axLoiCwGLu1dcx+QBRJPeEMDHDEO/rd/aFogtT5Q0j6c7cMFuD6IopyBFe34z7bjYWHaZhBDtH8Vd5bLHvSAamCLd1RGeF6a3bPqZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7swa0tYJHOsVNIUTPS6EeYUIRVfH0uqpqjSeNRhWXE=;
 b=P7mp7+sLn8uZtsimAZUlDrI/nOwxQbGvg2hkjeOnDKlxlUe68GLozWMW5PgJOx3upZLMJ3Jw5GrieFWm1eeogM3wkh4Ojnjus3JH6hZsiFk2CBqGJmJKOZ6ICOJzH0itlq6ZQzTTm+vR++SgworcOqiclV9OiqtqMmopF/CrSbtOqRJrXSNmw/xP3eYVAdMCZE+rhWBLsGz+5aijdpIjH+Ma2bqzVyCQhfEa4ZalCoBcbE5+6XiJv7dsuAaxZl1++10DWT3Y30qsx8EFngg26/bEq0XdKSWq0yZPuDzsLwTn72+hsrJdFk1NVBvVFyK93sV3FvyWeEEj3uIIHriPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7swa0tYJHOsVNIUTPS6EeYUIRVfH0uqpqjSeNRhWXE=;
 b=EIgf8fCJHNBKoDTbRfQwGkh2HEi0NvL8PRv/663HH3yC1wJfbSrEIDT6ZM3VwCYAbJJH6PxRzJtZNhnsS2zy18eZD6jYHIeL276TZR9fCtDfV1Nd48uBQ/GVgcBX6RM4/uRWGMiJVwzi90JDBNI4UKofTmyhgopxvrCNLY9r4C8=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH0PR10MB5659.namprd10.prod.outlook.com (2603:10b6:510:fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Wed, 18 Mar
 2026 04:11:01 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 04:11:01 +0000
Date: Wed, 18 Mar 2026 13:10:48 +0900
To: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
Message-ID: <abolyGbAyynUANDB@hyeyoo>
References: <aa-1-Y3v3D1hzPvL@hyeyoo>
 <69afba32.a00a0220.d013.0002.GAE@google.com>
 <aa_R-6SdHYBBkQX-@hyeyoo>
Content-Disposition: inline
In-Reply-To: <aa_R-6SdHYBBkQX-@hyeyoo>
X-ClientProxiedBy: SL2PR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:100:55::31) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH0PR10MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: e8334ed4-dfe9-4ac4-f5a8-08de84a45d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: /fwrQ+jjqDzuG3ao0MxA8icgRQ5x8hPsAnZcZDpNbttquqS/zkE6spqdILlf/W9BI+FSOhpJsBHGO3bL3/2S6vL3vn2OZXiugZJuf5hXcneQDGBkj0AQoAQnODWJrldDsBSAS6uHov4pVtFCSu6AAqqeMtK8HAg+Ty6CO1t6mUOgSBxeGL3HByEtqdmwYK356vDPnSl9BXfwF6lruaD/jTU6CvTZzb3btRN9oTn9ymF0Z0eKPF+k0wc9DDycKhpDi7acrC8X7TqzFoxFy1HZSFwY/KZBM8hV977wFbBhThkJtEWZX4RVErGUZl4A/p6mPXJWd8xqVWB+L4i3kv1qictbwKs/lJRNeNlBZTazSCDKChD+pM9bgW5ZqWt6VzA556oIbe+vWoe4IS6HnN8F67yUiOV9C8yrig3O3RM0DT9G0maXkqIHhzAykP2MH2SoyiIZT//ODjf6s8ik7Q7G651HPjLgpXa/0hfyMi/K6irB1S5GE2DBkxd2CJQQ+YcHCNw3rKm/U/BAt4R9Sd9yv0PwrROiJ8R1zLsikDsgH5Z7BlyhWe7MNxIo6zVdYOkCD4nZTtjJBtldzMVMqvHPfF0Q2AI59vCbI1MEkOMlWL4SUZedi4BI3IlBRbU1oXYfH2DFg/zVkJMZXMKB1qHEgPjtn2KLSzGUOaA6dHdFRzwqRVAT8fhSX+xvT05eKeefejXe/HnOMF7dg0Kj6TSPpolN4D4bORiYQre3sNxs9Kw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GP+q5PyRB7nbPVS9yzfI/hJ/NXX9PyVryPG4YOI54PH+/TLnEMF1Ei1xRftG?=
 =?us-ascii?Q?b5fTMzuYDwtLl8ohNXMRBcl5Abqw2F/LwDFKI/R1SZRgKfoVmJgJuEdSSxGS?=
 =?us-ascii?Q?nlRRJcP+oLHIVQSjXj9R6KFXnUfg0HvFpUljZMIhvXb3p4zN6RZxhifH0WML?=
 =?us-ascii?Q?YpnkvkXe0l5uKdecy4JLl2X2DqoHy1tBzcQpLY9tE1chaL28L0FuoTGV/txD?=
 =?us-ascii?Q?6m8OWUm/8UdzZzNRKnDmqRBJkq9+ViIv4bgmREIWiTw4wo6Qy+wIe0ZphXoB?=
 =?us-ascii?Q?KZtZSQ8Zyl+rTNWqgpoV9g7ZpZbDxACaqleST/yI4nzJkj30mUkhzuivrzj+?=
 =?us-ascii?Q?3WknlspRyozdWs6izBfmXhhil16IUvfxgWevXFrzn/YEjvT/zm39CTSTDKYp?=
 =?us-ascii?Q?4I6wY9NmZ0q13RR3OFTSyNCUOPcWZnwqqDvLWWIXHyXY2qY0OfK3BfRWeX7K?=
 =?us-ascii?Q?0FBPCC5PYPmSGciXvgLjQaTnatAGwHvoTrEWDSX2o8Xv/VkKG5nXdGPOXdyD?=
 =?us-ascii?Q?/j6rW7FGLpCAn10TeOMqss1POtO4Ju7vL6KTMLAeAHG7imJzFvZFcBDVaFx+?=
 =?us-ascii?Q?6pYHTGozce7TI2yKScHJF7RsDMFb2RXlAp09pyGy7UOXKfVANG1GS292WFs7?=
 =?us-ascii?Q?etTDiwL893byZCYlWPrbo4ZCL5xgxtwFSf4V22XJek/lsrgCYTlzAu59bfxH?=
 =?us-ascii?Q?6xQcz8rrNyXOMTxVItCOK+MO8D8ognJHm6QlBOXgf22kD7KmJ9RMomBa1GPM?=
 =?us-ascii?Q?he8JBuP+9xnrIUSBY0XevbXzUlsdd3S2TPEHKJd8QV0F+RVco+X1CZIMwyYO?=
 =?us-ascii?Q?nuiq+/0onzL/+9nJL+a3CoTOmiYY44P//IWCt1b3Sm/JiaFxMOEKk+9sJN9b?=
 =?us-ascii?Q?mYV2I5pEDMycTpmY3msF+xNQS9b3ObB32wwbtVQudp2+QsJHLNi0DG/xJJmh?=
 =?us-ascii?Q?giDMFNtHWPWamZyNcMChj8r6vaxEYuESAd65kNJyFzmhTSWdyNpJLWC4B7J6?=
 =?us-ascii?Q?fl4Xiuw6VpfSeEAhEHaQHpD9k4Mw8JTy4fvJPSQ7x5AU+F1LQAlYOJiG4lj1?=
 =?us-ascii?Q?bb8SLV9DSxBgi3/0RZ0pgGo/ltk204rAybdmgagEfRYL7fPRJN8rsYPK+SlY?=
 =?us-ascii?Q?GH0FUwaQI8xpLopCM2N0Kuu9tev5G3U5lDBXbkhv/BEYfWArOJ+of3MqWVas?=
 =?us-ascii?Q?7G9D7twM6Ihqs02kENj0GnIzdmxCd/mv3B2HuKCI+PKDVaNTM/pyJMX5La4t?=
 =?us-ascii?Q?A6VvNYJ/0UbMMoONVex6wqm4l1iLeSGPavdKUgF+yrVD96tFmYC4VryDT7Mw?=
 =?us-ascii?Q?6cRSF2Xq2WdOpXi7TZEy3aIQUGP9PdNI0H5KB1wHlUs1Zev7IyADyjqoES1D?=
 =?us-ascii?Q?yDM/GlZrs5NHWsxIXuDVIQVYHW0nkZQ0BW+sh08DGRj9ClITCDr5xQgDA1e2?=
 =?us-ascii?Q?6V5l73pzYienDAXJkQCCwmNhLxuYGld2dooivRPp9HiahIi5FH33VHsvgqux?=
 =?us-ascii?Q?Emkn4dXkTR5mMVLNWXaOqb1UHyh5oPxksCPympao1RJpJ1Jxf6e6K+PuHIzn?=
 =?us-ascii?Q?4Dp6LWaFY7FERiwSErx3fW5TibUajghS7EUtYFSNl2k4OwObd41b6EeuL3Tw?=
 =?us-ascii?Q?iS4Lb4DnnmlSHjdmXQik4BybzLZBCLpAbHY5QMax71+WkTubu2ZacJwpmuTx?=
 =?us-ascii?Q?kgIR3JfVjOdmBIfiZl91fFBCFw7457u97e8csqIeOzL2iM4K7gxykJO5nOH1?=
 =?us-ascii?Q?qE/Suc2c7g=3D=3D?=
X-Exchange-RoutingPolicyChecked: Xc420Qrn7jglw0QYGr4NWUiKyDCVwBacK0Clir3HPXM5Hnh1WhjmQ/JH2x3soaoGG5YKkPcHgvSX3vv8Hwi6jFofTMcQ2OERStfE8k27pmddP4AmUxp5LWPkQJ4iPGyY024gLT88IcgGz4vnzttNynruyUJEBGJWp9XxwyZlovmfuitRK7ij6++M8XZ0vhxLOTV7aQDY4wjbq0rbsiljfdClZtKUZGvwBWtBJ8zg+SFlV7bLgasufxWpP0+8J7ayFduQFS0KN3n0LNA5fiMyIbAVlqtR5T9np3I/VShnqdHcn+pVcE61EDgp1el3HjjgzP7U6mpDXYd31R1ieuRA+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: q+xc9YXR5N1LzALxPg5/HPktZaNGgU0ZTmcr10GQw1oJ4yHec43yI6WOmHzdl/hrZiP0K/oHx/vtqbyaT7yyRw/4/HN961SwC4EAwrUMIRo30gN0upBdxyg6Szk8h8UExKuProVFZB3zsc58nwwDvtWmaM3NOtU8R0IVv4eKSxUh40lBWDjccgLBYi0pfcKjnLMmvttoWnAQRtNjDch9inpMYyvcc8ufhyEptIx3uLNOpwJXxVnVgrX/qEaT/IcrkqBC+6eWz12bZjWUgQyQjzGOoB0ZZCyo46pGyEVZTckd15rNBgRbVby//tzHsVBqtAS9XJEhrOX04mI40PwsMSII+5w7V1eZ0E9T+5GQ7bjBgakoZDa4LPmGlutZgdHRl64DpFqlDUFHDr+CM3E2nB5ozAXBtumtYvCgHF/VolsyH1kijpfcFrblgWMzBhbQtWlN7P11CXB+eZmyVCVI+SmHZ+RWcZaKp2z/4RQgc1l4mUgtws+VIVvQ3IxIzoqkxwc7zktP8telsox8Pt8DZpJxOZJb7baKkbSI9QLLXrrQ1cpawvn4zQYxtyt1ONVRj/ZcslXRK8PHnsb3sQiY7ubV/cIMpLhyiHYBVpxjwnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8334ed4-dfe9-4ac4-f5a8-08de84a45d47
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 04:11:00.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfGbCA48kdiTYKCF4s257YTbkEHsrX9wz+HO3FqxrXhHb5Y8JUHBr36ZFV1dCUKMzf5/cFjp8VCEv7NKC4kGsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5659
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603180032
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX/WD8G/dQ+oks
 QIEuFc1cYeLBdAsJXzGLy7Y9IR1a3+UX7edzsNPzB8C4RYv3t8ZJ29zcZDzDKBDss2XXuwWS3tE
 JRlHJk/fjKhal2alXy+1AoMLEM2ll8ZQcKpAkGffoAkOhNuDrxh6l8uJhwtJ5U7ew8yT+lTJ9z4
 snH+t/H9XSfqbxvwTh7k+IPvTkkPwAAcnzEozTFFN1tc6lsjBky0b3bk5Qy2NUaPTpTQ/BtqgbV
 c9GJALXmqYrcGOYTa77FmqwqoQxk+QalsZZTyxcIfGUJpvx7nxvWUwKPBzVko9GkTmFpGVotpYG
 3UvRYKqLV8oi8B2iaY3lDS4HiINUimaqtTUJzDcf+ENUg8blD5TKY5sYRDUrvvuJwOIrH3Cx5SD
 pKEh1rk7qhyj4R9j9zhOzRVoyeNSqhpMyeO7IuoiF2O5IJ0vHx4TYO7vgVu2tKpgLXeEwM0U2r8
 jcEPNB810DZnVFYCfgQ==
X-Authority-Analysis: v=2.4 cv=AI0/m/Lt c=1 sm=1 tr=0 ts=69ba25d9 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yDcM_PQI082ALmuDeGQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: odk0HEAym06OY9B6vyxYVQEip9MXQ1xP
X-Proofpoint-ORIG-GUID: odk0HEAym06OY9B6vyxYVQEip9MXQ1xP
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz test diff --git a/mm/kmemleak.c b/mm/kmemleak.c index
 d79acf5c5100..b7be2cc1efc3 100644 --- a/mm/kmemleak.c +++ b/mm/kmemleak.c
 @@ -50, 8 +50, 8 @@ * * The kmemleak_object structures have a use_count increme
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w2iGK-0006Nz-Hk
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
From: Harry Yoo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Harry Yoo <harry.yoo@oracle.com>
Cc: wangqing7171@gmail.com, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 jannh@google.com, catalin.marinas@arm.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, liam.howlett@oracle.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org, hao.li@linux.dev,
 pfalcato@suse.de, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, sj1557.seo@samsung.com, linkinjeon@kernel.org,
 vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-5.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:catalin.marinas@arm.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:liam.howlett@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:hao.li@linux.dev,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:sj1557.seo@samsung.com,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,oracle.com:replyto];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,arm.com,googlegroups.com,vger.kernel.org,lists.sourceforge.net,kvack.org,linux.dev,suse.de,linux-foundation.org,samsung.com,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3944A2B5BB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

#syz test

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d79acf5c5100..b7be2cc1efc3 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -50,8 +50,8 @@
  *
  * The kmemleak_object structures have a use_count incremented or decremented
  * using the get_object()/put_object() functions. When the use_count becomes
- * 0, this count can no longer be incremented and put_object() schedules the
- * kmemleak_object freeing via an RCU callback. All calls to the get_object()
+ * 0, this count can no longer be incremented and put_object() adds the
+ * kmemleak_object to a deferred free list. All calls to the get_object()
  * function must be protected by rcu_read_lock() to avoid accessing a freed
  * structure.
  */
@@ -93,6 +93,7 @@
 #include <linux/mm.h>
 #include <linux/workqueue.h>
 #include <linux/crc32.h>
+#include <linux/llist.h>

 #include <asm/sections.h>
 #include <asm/processor.h>
@@ -138,7 +139,7 @@ struct kmemleak_object {
 	struct list_head object_list;
 	struct list_head gray_list;
 	struct rb_node rb_node;
-	struct rcu_head rcu;		/* object_list lockless traversal */
+	struct llist_node free_node;	/* deferred freeing */
 	/* object usage count; object freed when use_count == 0 */
 	atomic_t use_count;
 	unsigned int del_state;		/* deletion state */
@@ -209,6 +210,13 @@ static DEFINE_RAW_SPINLOCK(kmemleak_lock);
 static struct kmem_cache *object_cache;
 static struct kmem_cache *scan_area_cache;

+/* objects pending RCU-deferred freeing */
+static LLIST_HEAD(objects_to_free);
+static atomic_long_t objects_to_free_count;
+static void flush_deferred_frees_work(struct work_struct *work);
+static DECLARE_WORK(deferred_free_work, flush_deferred_frees_work);
+#define DEFERRED_FREE_BATCH	256
+
 /* set if tracing memory operations is enabled */
 static int kmemleak_enabled __read_mostly = 1;
 /* same as above but only for the kmemleak_free() callback */
@@ -522,14 +530,12 @@ static void mem_pool_free(struct kmemleak_object *object)
 }

 /*
- * RCU callback to free a kmemleak_object.
+ * Free a kmemleak_object and its associated scan areas.
  */
-static void free_object_rcu(struct rcu_head *rcu)
+static void free_object(struct kmemleak_object *object)
 {
 	struct hlist_node *tmp;
 	struct kmemleak_scan_area *area;
-	struct kmemleak_object *object =
-		container_of(rcu, struct kmemleak_object, rcu);

 	/*
 	 * Once use_count is 0 (guaranteed by put_object), there is no other
@@ -543,11 +549,19 @@ static void free_object_rcu(struct rcu_head *rcu)
 }

 /*
- * Decrement the object use_count. Once the count is 0, free the object using
- * an RCU callback. Since put_object() may be called via the kmemleak_free() ->
- * delete_object() path, the delayed RCU freeing ensures that there is no
- * recursive call to the kernel allocator. Lock-less RCU object_list traversal
- * is also possible.
+ * Decrement the object use_count. Once the count is 0, add the object to the
+ * deferred free list. Since put_object() may be called via the
+ * kmemleak_free() -> delete_object() path, the deferred freeing ensures that
+ * there is no recursive call to the kernel allocator. Lock-less RCU
+ * object_list traversal is also possible. The actual freeing happens after
+ * an RCU grace period in flush_deferred_frees().
+ *
+ * Unlike the previous call_rcu()-based approach, this avoids embedding
+ * rcu_head in kmemleak_object. Objects from SLAB_NOLEAKTRACE caches (like
+ * kmemleak's own object_cache) are not tracked by kmemleak. When such
+ * objects were linked in the call_rcu callback chain via rcu_head->next,
+ * kmemleak could not scan through them, breaking the chain and causing
+ * false positive leak reports for objects queued after them.
  */
 static void put_object(struct kmemleak_object *object)
 {
@@ -558,14 +572,46 @@ static void put_object(struct kmemleak_object *object)
 	WARN_ON(object->flags & OBJECT_ALLOCATED);

 	/*
-	 * It may be too early for the RCU callbacks, however, there is no
+	 * It may be too early for deferred freeing, however, there is no
 	 * concurrent object_list traversal when !object_cache and all objects
 	 * came from the memory pool. Free the object directly.
 	 */
-	if (object_cache)
-		call_rcu(&object->rcu, free_object_rcu);
-	else
-		free_object_rcu(&object->rcu);
+	if (object_cache) {
+		llist_add(&object->free_node, &objects_to_free);
+		if (atomic_long_inc_return(&objects_to_free_count) >=
+		    DEFERRED_FREE_BATCH)
+			schedule_work(&deferred_free_work);
+	} else {
+		free_object(object);
+	}
+}
+
+/*
+ * Flush all deferred object frees after an RCU grace period. This must be
+ * called from a context that can block.
+ */
+static void flush_deferred_frees(void)
+{
+	struct llist_node *list;
+	struct kmemleak_object *object, *tmp;
+	long count = 0;
+
+	list = llist_del_all(&objects_to_free);
+	if (!list)
+		return;
+
+	synchronize_rcu();
+
+	llist_for_each_entry_safe(object, tmp, list, free_node) {
+		free_object(object);
+		count++;
+	}
+	atomic_long_sub(count, &objects_to_free_count);
+}
+
+static void flush_deferred_frees_work(struct work_struct *work)
+{
+	flush_deferred_frees();
 }

 /*
@@ -809,7 +855,7 @@ static void create_object_percpu(unsigned long ptr, size_t size,
 }

 /*
- * Mark the object as not allocated and schedule RCU freeing via put_object().
+ * Mark the object as not allocated and schedule deferred freeing via put_object().
  */
 static void __delete_object(struct kmemleak_object *object)
 {
@@ -2209,6 +2255,7 @@ static void __kmemleak_do_cleanup(void)
 		if (!(++cnt & 0x3f))
 			cond_resched();
 	}
+	flush_deferred_frees();
 }

 /*
diff --git a/mm/slub.c b/mm/slub.c
index 20cb4f3b636d..6bdf409d427e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7537,6 +7537,7 @@ static void early_kmem_cache_node_alloc(int node)
 	n = kasan_slab_alloc(kmem_cache_node, n, GFP_KERNEL, false);
 	slab->freelist = get_freepointer(kmem_cache_node, n);
 	slab->inuse = 1;
+	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);
 	kmem_cache_node->node[node] = n;
 	init_kmem_cache_node(n, NULL);
 	inc_slabs_node(kmem_cache_node, node, slab->objects);
--
2.43.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
