Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C34839748D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGk-0007cA-Jd;
	Wed, 11 Sep 2024 03:43:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGh-0007bq-53
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=; b=cROYG3QPCaNtk0oMLT4MmoHgDp
 A7YconSNVgpnBy28Lp9utFniFdD1jzS6Ve84P7ou7YBcDGQVhMQHROpZ9U7lm7HUaLUjPyZAYH3z8
 vZwCs61PHBJTsxziGtdmNVzlgfe82dLrSF9xRkL8EjK0dgREOzrrYwW72LjxRqh8REcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=; b=aycgwsEgY+5yXeENnZ+YUKYp9X
 LkMgos0YerdAtJlxksIEcg46iA2Eh6bojjO4McnEHl0CZQIa3BvsJCpOgVIE9xLVnGbgzQgRTa33a
 QWlfUR7loYI0lf381dBrG2z8QbBplPA90DmkBFVApy/jTxWIHcb5yIVlEox1TxSYPeXI=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGg-0000Nz-8I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIxkpg+YhJm6uvIQ+QnU8vjzAsnBgTYDMX6d4BXI8NN2RrKU4CY5qZ3JGH4A7u4FDfggS3xdTtJU9BEadgjkpFX0tjfH7/qQQjDFlPctXYMcf5HdeNElcYX/+R1Uvuz4eUhEifbtK1cMHtswZN4FWMIQYNMvyVQJkhWUYhuNkcNAo298YvGBOK+8IUDi9xkvmKE35F9eSEfiem6fHpi/JHlBiTIx/wJQ3PS0eqi9QB4PZY+mYUJ42exCMCB+T+HWu5URlzNS+oXJ//qMs9owzNnjHjA6YRGKrjnhUThwbFYZw3QjWSRIa26SMUBhxFtadr2J+3ew4JHdK2Mc0WwZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=;
 b=JiyVneVtbne/KCJpYar4AixLMzGeLxLl96PAarDo2JjVNj/qHvXNgd++Zlkf+0JQSxZ4tjXJFy75qlF9nxEYnvvc2voRWlFwySpQ7ulZ5874Oy51MjiGcSzbVkIa93Sk01stVhk/kaFVM+bQ6S+vhQkfrkisegTqPj/MIH2RFUThWSiAeAz+1LdMPC6k7MpY/IBDhppJMhMHcD971r7FsRyouKtoKTPdhTHpJ24RtBqpQDTo21yuUdPCIhAqPijRnORuYKQ+remxdNiscvi5bOya6xcF0O0Ym1WOLvzQswYBapvFo9vJ9d01WDPnBCohoZIWMaenO80Pg+2S0HL6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=;
 b=iEJ2EqAIe8ROgadflNx2K4Ge2OxaCb1Vuhk9X8BFd1JGW6UetDyPY8pvKpkjwExFAJGPxcEA2zwu+YKwg5fw+8pkBt9sbbOPooI8qkmuX2XYX9+Oy4DZTdv7Gawimb/AyTE5yjEgv6z4wPDUTzDMQljBtzrcBAFmWsbHkbc8w/DC+Isiy9ezqkxrYWm15vB+0WswgGUpU/hjR7KlXn5L0kRk55iDbuK0qvPhqgz1lQyjQGXCfU4bQ3w7lcAsn4Q/+ecgnOhfbnsVx9jyTB6cg53JUQWjl3c4RmU4iRdzOTlsChL5cFTsrNX2NDmDXlxQQy7PqRI+A1q8iCVUeGtC6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:40 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:40 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:20 -0600
Message-Id: <b469bd6ecbb015b02b7a89b4f8110cf2c09f4275.1726024116.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: e3acec04-7dd7-48a3-0c64-08dcd213ecc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YquSbgijNL6ZGSUMgB1ft10kpSyyhbzQo82voq35V1jENQPX0JYpTpo23Tmz?=
 =?us-ascii?Q?1J/3B7lUZhPRsPersbBhYMip02FfnQLgUEyX2lQQgz4aQ/n9R2Lfq9P33Th+?=
 =?us-ascii?Q?tuIFiZ4l7oO8KMRKxSTKuhye+z/OpdeVY5QpS5YbhS9gUhJQIgyic+HG63Rn?=
 =?us-ascii?Q?eq/3vqsEaFxp8Sj30WqZ1qkGqpdc7JxNRBKxUCIsSuIMMineUIhbAIC0lEMv?=
 =?us-ascii?Q?4PVd85NFYz8HmelViAFImeu/mykCf1IgGZoSYoSFRKNECG9+0eK40czwp2a4?=
 =?us-ascii?Q?dNzL3ngmE3fkOjEtqhJZ7cg8Zoq1x57bkuC9j9qDoxUoPBTSmGzQN+Hm0Nym?=
 =?us-ascii?Q?moQ7DR2To2LQJwZDcohztT7CxKdwvea/xTix7gJOnJeaKBSDMYFCQWH+lKl4?=
 =?us-ascii?Q?yrSICY02uIUpYlmV/R7LAG2YDQC7XhDxDOZXRMcnEpCAsX+GuU9Wy/cx4N+w?=
 =?us-ascii?Q?9pV5P7Kc6sw0RQj2Bc3EYKYh0Ji4RZ93PplNKUQv8EV0VLqqCSn0oASF8QYh?=
 =?us-ascii?Q?fDtXrjdcDTKVmXLMe/f1t8gj6XtN/bg8pOeeTfXCzuJxlcKzkrILm7KTRYfu?=
 =?us-ascii?Q?DSUwn09lCHAzEuDXQ1x+ChmKKiY+dgjXHER8q3U5KwxS21t+D0ch0OYcv9Kp?=
 =?us-ascii?Q?sHL6hFzEwglz89AMW50QDBf8WDIFr+BbgDUPOKaN+pJVaWSmPo9lKwpijwOF?=
 =?us-ascii?Q?Vfi8o24YXWyu55x+3rsrNLT5zPRunKs5rrbs5xxnb4DZ1WVuW2Mo8OHCUBpD?=
 =?us-ascii?Q?Ftd+Ttf5gUuE99pA6ufkodfymW0d9MO+sCtsfxblUEEDuq28G7tWMqD/xBcz?=
 =?us-ascii?Q?KusrGaZJmUX9IwJxT3aMFx1n+pCJSLTl4IDj2AS7nhsYHbG38AYAswNiZM/V?=
 =?us-ascii?Q?2bkt30n7R31owPXKS08pXVSk1ebj6AXuR0K0gzUEtxll4ZqUtLSZo0EPIRaE?=
 =?us-ascii?Q?8oaO2k29n1d1Supg96LVM5ML1grnAsukIwb8u90dVUSBC8gRRwk6QrXKl1GB?=
 =?us-ascii?Q?ccxFWA8MG+jl8T6ElJQR3r795d83Yv1E21JwC9MtUr+pdjF+DPms/04jCWnb?=
 =?us-ascii?Q?Zc3sl6VuJhqKmcGi3Th8J4vsxHIQOcNjwnozmUE6gTsa0nrRUotzJPxQGTvr?=
 =?us-ascii?Q?iOqo5kl91MGc9Y83VKm3z9hfM9j2WdeMegDUPp0UaBDHM+MO86RIrKYdxGgY?=
 =?us-ascii?Q?ShpvzGgxLnaqRlq2cvULVIysKrnL9Rf2YeJJ2Z4RjPfg5JoOGsMZeeshZkla?=
 =?us-ascii?Q?JGHQYf6DXE2p98RSq5JPumb9dIXjt3W59wIadp0R+Eb4+n68TGpNlI0EsnqL?=
 =?us-ascii?Q?QX2UoIUSRKze3s0ySrhICvuMjdFHFcVSnTYd7N2WPMgGmuvNnKGx66feyH8f?=
 =?us-ascii?Q?yPu547ecd/JVCYiQnH7TI2U4XQs8m56TQysVlWew2u02pnaHiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyE0ylNESw7V3dgni1J8WSSyCv9wBTB+jaDiWVav2hT9YKv+zGAdLTVMFpjG?=
 =?us-ascii?Q?dpItUgTDW1rUnyS0EVc21/jWwqxDwVzsHYisDA4cqA4Z5l42gXrbh0VR2TNa?=
 =?us-ascii?Q?hYYHWYCM4ARXCWSE1+fRMp9t2po3bXNAHQPjssQgv/o3ovzs100ThLYJSVBW?=
 =?us-ascii?Q?f6BCwQ13V332qRUVAfWf/0Zirp2ZHEvu2AiOxvcROlkM/fE5+G10I0E+gP4l?=
 =?us-ascii?Q?3jOFjASIt567LYDZ1D0qde8QtgdTN+HV7UtnuOvDTYjHt5kGx7co6UxRbC3O?=
 =?us-ascii?Q?jOkdJzHSYdRwHRKxp73VmZ4XlYQuTBwig2fIaBxQuCaXDaGi7At2IJK48YOS?=
 =?us-ascii?Q?LHcSwh2DBoUak2z3CvgQWDDehndnBMVHfG5Sq06mpVu8yoqXnPKpSE6w/Xyg?=
 =?us-ascii?Q?SDa3Zg34Q1kkmQZw63MtR+mNZFFQm+LJx5MS3YYbCxKLSrANgdW77s093pJ3?=
 =?us-ascii?Q?kvbBlyQLktC+Iql4wdbAhT1sRSrBr8mCnUKoGeePNK2mOzy93Ng+kVgq3Jvu?=
 =?us-ascii?Q?zaR1liOmcpUFtFcbS83uEVhZ2/JoHetdHxDKhsIBpKYT62lmjTn4Cm2BCt32?=
 =?us-ascii?Q?jS9Em8PAC9FU1tYxae/A6mZwu29nu+d0Rq+h7BCCx9F6FaedtBDPyyh+xkDq?=
 =?us-ascii?Q?F/ZfkWZyAY/O5xCszNTF0D117VTwxm/wb86oT2kSaGObZ9/NBNefBcKDHOU9?=
 =?us-ascii?Q?IICN1ZlSzhOe9djL1wQurc0u5LC2NtBpxVt/KDbNwcWOPVJKWQ7ZCmXgnroi?=
 =?us-ascii?Q?kSLdtMvgn7Qm/ncqOm3iYShFYOw+uHlZUT+Q3swlKoRiJ485ECCY2iYVO6y1?=
 =?us-ascii?Q?omph51yfqWtUB449syKhp2nErdhjk8+V4GrJipnXjZWxCM/nGFlmoqU1j5jQ?=
 =?us-ascii?Q?2qWoa8UYhCmjDV8/LPw1PNLCFgMrc3/Lfy61ONBO64HF2ZumdBlxO+lNwgGb?=
 =?us-ascii?Q?maRcl6ZjbOUfg8s9pI5hvSK9J78HdX5YZslsFpTUA95VtzduFuHuwWX4ghA8?=
 =?us-ascii?Q?BoiP3xf8D3QertUJAy8UkrFmTY3k4ZA2eeJfwOgmADdbQ/Lc4nVK4CCDZPjK?=
 =?us-ascii?Q?0yGAJe4+N6eVnE/gpqpMaXCxt3/ubhek4vfZGGqSTXQJMW5Qr1cX8zTUS0U5?=
 =?us-ascii?Q?AsKgIKuqQmvMMcCxzC2oIbZVsw5t6erWrd6wkJ8DiF124yO/Izwi2op819yn?=
 =?us-ascii?Q?tOB++0b5c5ea52W16i5OBWCDJayqSimnDKN7k+DLBDjnpSfwcwP/vXdhiTiV?=
 =?us-ascii?Q?kvehzbmjuvGTTVpboUyyHDiAIaQsjO4nyBovMHE5a1tAfoVKyAuKvSK0xjeR?=
 =?us-ascii?Q?oXIdzQdH1Y0xOhlCaArkdzBOsC3ywDeW2g7fPBSL4Q4ced+phDrjKElAcLWC?=
 =?us-ascii?Q?NZ7G6FwDZhyU0472jbzCVXiFimbSoO/DkpyygYjYPWUR63+hCMVv7nYL7KTq?=
 =?us-ascii?Q?lUokMILzGX+XzrW7huAZ/CwBHDEW9lYkarWdNMPIOvsq5AteRfw2VZOaQWLs?=
 =?us-ascii?Q?Z/X/FgQspJlZe2ItHxUMZirj5s9mi0EYSyy8+DOfIw6vwgf/LovmbguqRL7D?=
 =?us-ascii?Q?9l/cgWSU1gBlfjTGACDHFVLuyWq0OhJn4HztpuOz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3acec04-7dd7-48a3-0c64-08dcd213ecc5
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:39.9833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPnfvxbyiQsDKuCHh2ET1gtYeGOGcb7yEZyocXB0suH/DOyWMvKe3x1AAkay+4xsIIWhDYw3NzYbD3mOfgQ9SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix to support seek for inline tail files Signed-off-by: Wu
 Bo <bo.wu@vivo.com> --- fs/f2fs/file.c | 17 ++++++++++++++++- 1 file changed, 
 16 insertions(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 957d1ff55350..dda4cf6d7325 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -400,6 +400,7 @@ static bool __found_offset(struct address_space *mapp
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1soEGg-0000Nz-8I
Subject: [f2fs-dev] [PATCH v2 07/13] f2fs: support seek for inline tail
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix to support seek for inline tail files

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/file.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 957d1ff55350..dda4cf6d7325 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -400,6 +400,7 @@ static bool __found_offset(struct address_space *mapping,
 	block_t blkaddr = f2fs_data_blkaddr(dn);
 	struct inode *inode = mapping->host;
 	bool compressed_cluster = false;
+	bool inline_tail = false;
 
 	if (f2fs_compressed_file(inode)) {
 		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
@@ -408,6 +409,14 @@ static bool __found_offset(struct address_space *mapping,
 		compressed_cluster = first_blkaddr == COMPRESS_ADDR;
 	}
 
+	if (f2fs_has_inline_tail(inode)) {
+		loff_t isize = i_size_read(inode);
+		if ((isize >> PAGE_SHIFT == index) &&
+		    (f2fs_exist_data(inode) ||
+		     xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_DIRTY)))
+			inline_tail = true;
+	}
+
 	switch (whence) {
 	case SEEK_DATA:
 		if (__is_valid_data_blkaddr(blkaddr))
@@ -417,11 +426,13 @@ static bool __found_offset(struct address_space *mapping,
 			return true;
 		if (compressed_cluster)
 			return true;
+		if (inline_tail)
+			return true;
 		break;
 	case SEEK_HOLE:
 		if (compressed_cluster)
 			return false;
-		if (blkaddr == NULL_ADDR)
+		if (blkaddr == NULL_ADDR && !inline_tail)
 			return true;
 		break;
 	}
@@ -473,6 +484,8 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 		}
 
 		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		if (f2fs_has_inline_tail(inode))
+			end_offset = COMPACT_ADDRS_PER_INODE + 1;
 
 		/* find data/hole in dnode block */
 		for (; dn.ofs_in_node < end_offset;
@@ -496,6 +509,8 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 			}
 		}
 		f2fs_put_dnode(&dn);
+		if (f2fs_has_inline_tail(inode) && dn.ofs_in_node == end_offset)
+			goto fail;
 	}
 
 	if (whence == SEEK_DATA)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
