Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD747ADB9AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNoV1ruJdvUH/U1W1tOl9UBfaDQbHL4VNQi6/oZouvg=; b=AJiWfzBplesZy9T2vkZBISMeqe
	hI5+TUYovbY0c3XSEnMRUH1N3/Y6hGt0XKcSTSvce7/XwTKYn1QL6UCQctOLfsuetBKQiDU0HLc9t
	9yvm8ZNzpfwDdD/QkkHqWaE1Sj0jaJSpLJZCQ4FdoE76GvDKWBWMSGj4pZwo1kDu3yus=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFbd-00067I-0T;
	Mon, 16 Jun 2025 19:34:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbU-00066v-NA;
 Mon, 16 Jun 2025 19:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PisCcjHnuD/KBBiffaAYhZowH43bXC5Xx5sWxci3I/Q=; b=cjJj08QLcaVqOr76ypRUU3Y6Cs
 WeJFN+SEoFNXAptImEirZdNc15I3cWty5naY5tv8B2qajIqsoqS7GtMZHrCYhgx1QUjlRPuV1pUae
 JDgyXjGwiJZZPXTeZ4Ab5VC4aONwrb/5MnWO7/2k6FtlcamIzxrbSWRHCadjJwGi9xK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PisCcjHnuD/KBBiffaAYhZowH43bXC5Xx5sWxci3I/Q=; b=N4mGgKR4LApTgxe9q4EmKzLCSg
 oVgM1yupf8eAio616Esyp3HFEjzptRc86S/cqlAet0yO6V00DbWfxlHiW/pV4H+dquZN7MwFDkgJp
 Z0hdEgAs9yQg0ZCiK+B0R+JCKOupp+ffRZekNDdx0QtGW+enwDblhugrle6bwDlsPf3M=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbU-0008IX-9p; Mon, 16 Jun 2025 19:34:48 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuW14006564;
 Mon, 16 Jun 2025 19:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=PisCcjHnuD/KBBiffaAYhZowH43bXC5Xx5sWxci3I/Q=; b=
 oDi1ZdgfxouGbxJMgIzHoyHg57y12Bzm8WzO7/TycJCCiPp1YcDUFmM3cFZY2n78
 KdTDVhrP0hv8AfrRHcGiq1tMIAIX2YJBinKxNDkMPlcYm+Ed/wWKcT9QEViZlWo6
 YsPwX4uufS0R1AbmWPACyI/MYWcrXg9n2rrni6n03R6L443+HuOB+hlz2fNwJxkW
 pq3EFKEbZZ6B9VnuxsCTjW3Y3MvMgBdBSHEpCWXdeEyXlUeDXhe5w7kEpBgdFhbG
 8bTSdCdAaMFvs3kDFMZcU1w64e014LDMPUNE2RcIZlXogHj+MJc2wLUdR98xG4wB
 zoSnx8KDliMSrUXUWo6g0w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900euq8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:33:53 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJAKnZ001648; Mon, 16 Jun 2025 19:33:52 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yh8bqb0-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:33:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZaNJ/Jz7/VgrpFULgMNY1Nu4rhT2JYEcMFtqDjZEB/duHNCIo6apGEJXARVpz5xGjbb31EbhCOYZLY9i7hfvHkTAfYkWgLbDTQFKXKfW28+IzGYtzsZD5zEE51NfS0NeQFFPLQji6KnqScYPFsDgByHoa6U6LwnFtBHqfcXVs+sOdiEDflHBDO+4AkWbwc7Y4BLNAcNmqM3aHgTr6QNt4Suwud2jUIH5xSlBsXEO91Mb1nolIMwm0o/NCNeOm1hCCEU5wedZP9OvmMqCE/j+GcJi50uou26VPpVlEIBIFyC6jAIj6nAmam9TTleJpayj4/3GC9KBjLhhxPSvB8IHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PisCcjHnuD/KBBiffaAYhZowH43bXC5Xx5sWxci3I/Q=;
 b=x9Q9olioYpxX4qmQqsmzrSlNLVO4D2JqALZqOc7fGilUwuSMNu1Ht3oR27yp/jiJx4qqkXnnqIB/tIcvxhj7IudXlWrAa/AVo7nwM4ihOpVi0G9ovNHK+nrVORg3Q73wtFWX1NjPmUo55GJENZhQjWbqF1IL0tDnG41/zOMfTVsXt3Y2neOUzR2zMvojihHlMwceq5Z0TxJxCCuy4xTVBVD5UqBnjcUiUwzvo2OMB9qFvkXoI5ri5/OLxolA0uR+LaAj/GDRYay+7r5EoZ4SZPps8UvbM1souR7IEZlUQv17L0ohiATHds+4ki2ey5iYjdDAggjsfLUipoIc7cv4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PisCcjHnuD/KBBiffaAYhZowH43bXC5Xx5sWxci3I/Q=;
 b=QZFA+j004qJy3DmWDOrW1nvK8uuTzZBbrlzw/kW0/gWTojDpwtKN7zBjt5slrO9h7o6BHX435gS9qlq7vWMDwYJKn+uI3QcbayjisYRrySnv/AsYkJwUXzBWWeDDdjq459o33DEgwxiiDsBhbtqKhYMHhoq3zI0dYEbqEgjmbBI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5870.namprd10.prod.outlook.com (2603:10b6:510:143::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 19:33:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:33:46 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:21 +0100
Message-ID: <5f120b644b5890d1b50202d0f0d4c9f0d6b62873.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO2P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd43371-0c5b-4ffa-d82f-08ddad0cb66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yB6MK4kQk7znYLaRI1/05ScSAn5/ywfj+aHpPk4tsxbdMcIMg/xB/7hnQfu6?=
 =?us-ascii?Q?ebuoKB1Uuv+6BoXVOPq66f/854sOTV0NvRgBOe0mv1qVyPvDnzeCnMjHbZ1H?=
 =?us-ascii?Q?x1zwdjaws/ApY+lQCf/jOlwyUUjX67ejptewh2bwxuXZyaVXQNqs68vSzi9n?=
 =?us-ascii?Q?uwIei9cDCYMMmfoTW6nqzKWAJfAATdSZs8QGKYO96smjcBGkj/xVX79SdbV5?=
 =?us-ascii?Q?DHH3Bx6v7XsOcfOKoLV/O9F70STAaaASyMOf1NikMH8BCDuIj+pEIS2p0gMp?=
 =?us-ascii?Q?HsX1Hs3uCLDJRKT/NHDgMW7dQwlORuz7TJkOw1rCvcMAJB+DoTl8JaxsMa19?=
 =?us-ascii?Q?dYx4U8bN197LEuf1oyDaSeHXIeBlYWx9n+s9AOioR/XpTb6ZOyXHJei6FPtQ?=
 =?us-ascii?Q?NS8uELQq+tprdfNig350LYMUSsLvbRJmDRlPQnjRa3oh6CVEoPc6ALVFJuFP?=
 =?us-ascii?Q?B3bHPy79DhHJJizWlVV3wvj56M2CieBzccaiqubw41xI20JSRA3gyh+I1ZcW?=
 =?us-ascii?Q?ZsHtm7R6mm7Q4Xr9Hcq4lSBDNKTLQSKlWZ7oY2KNRVlqBu+gljTtGYFNm1B3?=
 =?us-ascii?Q?EXo1z7Nr0IVW1S8pj3+2aZAS2Glu6VngNcmWjavg736xb3XJRXEsZjr4dqPb?=
 =?us-ascii?Q?QfqhVuyrESPsiDz6Ws3v3Gl/4xdqXvLvLaFS9225opCR+dtUPcdIMNfJc0hV?=
 =?us-ascii?Q?V3wDrYBOoOXPfvkBi7zikNL6VpZmpI+6LEtC9bKqoX67467o4NqcKNZbY0jR?=
 =?us-ascii?Q?NAFq/7mbdF45DN60il3opNe8MjZxM1HnGCWMwaf7sS9r/x/dNx2VWzDhFxaM?=
 =?us-ascii?Q?P7uvNcSEt+w8CmU5B7EkmtqX4ukKaj/Bp12BC95zN67VJ6i9yGoLVGEF6sEa?=
 =?us-ascii?Q?xpe+xkhx4gAmOwgvESExLyFkryRZ15JAHwcMEVYF3cR8yGLRtu1ZTjIj6oOF?=
 =?us-ascii?Q?3uhQP7ZRny6BQt3fhJvL34+w+2BoiGcb6JHvLxERhhoFKiZU7bfM/Spg2scb?=
 =?us-ascii?Q?07c4Tyvas4xnn8zuMNx8y4RWFNUtaQmxXxe2QUyD5WQyLkEwvs5xZy5dHxLs?=
 =?us-ascii?Q?2g49EBADq4u9pWXDXdKfeEWff3ne2080CbKEFh7HTI7ZbohHtITRWJq7BJgH?=
 =?us-ascii?Q?JMPM90XZ35gHJcfXkEMuUx6Y5NlNv2Un2njdvd5xoq/Nfd0GOQpIXMUsgHRp?=
 =?us-ascii?Q?GmNe9DfEKwjclirt/oFno/VJaDNjv9fW2rQZuS/pe4z+OmiGyDGQfsvaZvlO?=
 =?us-ascii?Q?oQf9xcbbcGxDajUSIxEdY6a1bJujOuFMrYFqJDn9g6zvzTV7+i/o1lNEr0vW?=
 =?us-ascii?Q?Qsdaua3qso1ewlTFDRvV/U9kShjL7ifcdQ3VU29TCWfir8yS/foFoFhrc7Yv?=
 =?us-ascii?Q?/bFjzZtepdXrwcNlLDR+VVQKXk7FjE+fpJwpAY8jKDIa7TrJn8tOSUcl6Fq3?=
 =?us-ascii?Q?bogGrkknfKQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?59IvZN+XJ2j5017eL9ZjpDjyPykBezLGPayHd4p+xxOz+9lcBDGx/ao57R/i?=
 =?us-ascii?Q?5Ak4qVnP8TvQfSR88eodBhNw65Z5a6ovXRtyK7r9/zCgf3fCXfHRcf6M5EAi?=
 =?us-ascii?Q?lu360HXZSsjkjc0NtRb5LUwwl1HBn/mH1pQY91al2C7aXkkapPUuT7FDnZVw?=
 =?us-ascii?Q?slcYDvmxn7rXU2s023e+rDvyi7NrlS/7ritWsIWVNFufkCdk+WvdL7gocyou?=
 =?us-ascii?Q?UWVIXG6ObXPMqn1lzFI2JwxVDcCqOBQMJaavJSyvWhS5oW16aDumesauUx5L?=
 =?us-ascii?Q?ry7trzrXwuRlGwCOfA4r4NBX3X+HRfBibqH5xIkfwcve0qkY/wcSzUt5pZ5X?=
 =?us-ascii?Q?KmC/irKH3kTVIIOEp/3fVY2TohjwVPHwu7SqX119SNDdD6yVBtEJG12H0J5N?=
 =?us-ascii?Q?Oq/M7gNbAVR6t9MPsGgeIEEv4QD6/PQ5yxVZFE/7nbMKc3PWFoHY8AerxNuK?=
 =?us-ascii?Q?gNhikkYIWIyITui+kh8WJK5d59dlTqSPi0HVCL/lZH0SrJbOh3rH3HZcMrnN?=
 =?us-ascii?Q?z0NU2VxDg+u3eFVsKOWCI2L12kqcZ0tbLrgoiMpM1tQmv5XeRMAsKPEZwJ1W?=
 =?us-ascii?Q?51Os+t0ny1Pep5qep/Gpq2xPtoSr/2hunvNR5sexchjMszG7K0d0XyGRMVcF?=
 =?us-ascii?Q?SeFbcVMuoGrpI9FW55vXHBvrIHnv9fSSwzzC9HKugNcmU3pTqpNAgcqRZSUr?=
 =?us-ascii?Q?4NXZ6g6A+ZQWjvslvCzsScONQtAnXbbrLW2hMaplSEhD/5EbZ92x/s9+mfNm?=
 =?us-ascii?Q?U3YPMykWAMFyZ8TrEI/zkrhVkzRp/poHzIqNI1/CftpoV/izCTJwvxMLuvTr?=
 =?us-ascii?Q?VXhbay24fsAT5GaZIcLEIe+9wajkXM65vuD8Mlk3v+QNE/+tUE4s62oFHX0Z?=
 =?us-ascii?Q?IPUj9oS93CXq64fbTBBgQ6V3mPdVe4Pizwg/ERBZkO17XcDTr6eI4tKo/AgK?=
 =?us-ascii?Q?h94thEqlJx3xcsE1Y4qXcRnws41+qcfLbHlqW1lH9qPTDCx/7YatqTl8ztuG?=
 =?us-ascii?Q?Fl1icewC0lMpMHaWZOWzo36GWWfJkfK1RZEFdSIlLZRjNiHy9N1yTohPhr6M?=
 =?us-ascii?Q?I30wPG0LiTODf6Fvcfnq7wxzpKZXY8JYPyIe7U7TM7VgD0KCLPCsLJOADprv?=
 =?us-ascii?Q?hLFNYyRZpHk1MSy5zUDcFFD7MqYt/PJga86hMwYuhcCdN92kFAeXlrgCXROn?=
 =?us-ascii?Q?H0sARodl94smMNDHHUWHLolCsdBRUidawcaverFQiVRlYMt4qS0Sm4FI7QDF?=
 =?us-ascii?Q?YP4K4IlviY+RCNg5AX+rj2kYsnCiWz3xMXmrxch2wsKTa3xyXAHJGrUDcPTH?=
 =?us-ascii?Q?B2kOY6+Eq5kg6zyUu20r0l5JCr56suTRioGDW3GYmc+zhYRhiVCnwy5kjgYp?=
 =?us-ascii?Q?n+SnNZ6E16bXxl0FbF0ZQEBFOQNw3btRjGxEZmYn5VxcqsvWlf0WUo2bZGp+?=
 =?us-ascii?Q?HF342XLHYeFYfrWTaIVJYydAF2d3o+Qv9XKJF7w2isZaUJNQLWm771Uy1NC5?=
 =?us-ascii?Q?UpbY6iNjdKOvcdKbBEhrtZvZ+MDFTCg3R8Ce8Sdj16Xa+NfWepgg4unUs2/p?=
 =?us-ascii?Q?SgucY2LVWiFuWYEQMhW9pjaS3wBEPithevviJvT0YgW83Nl6ow+f7IkzKusg?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QWpaTl9xep3FCX3OMrR4Ps1WFkSiq+d1ldTwV/kHQfN1unqUbBl/j/CucCNWQgHqViHFebftCJx9CagU1FqiriuWTD02m8KQ3BpNkBmw5AzUV6vuO2JQdhO9K8pf0hJHdAVcYPe9Lo8tIky1KNbZDGmJhUZqOVkOBpfNB3e1TTHpK7M+XtRzzi+pLA4jXwY7swuDDgejWb8v//U6a9b3WIQTTbbYec8OhZ6xp+YhxoRpj5ZmTQqM8MTjF7Ve7StVzbsNJkY7LP9uP4gq3nZCmTxQ63KdL/5BavNaWNdUtFrS8nMeOGj2FBWJ/uqVY/wMt7P00bmH3/5QFT7+SVF1S9ehqrS37Fa1ErrhbpAbkar5jR/UctrSiSOnnb+ZNHZEjjRGUQkjJ42VzbelWMFKEfIdRSyJHhAdEGsnWCGMiqP6qMsiVRgY5ntKqp0FvaVk92LrTCa87D+G6fqv+j6vUiMrkurPlb4MTYMlYR0XSIFmqV6qaVT1P4RiGkPzWQ4ltPkfQeGMqDtJicls13B+XKf/Blik2OIJbJlobvCNnkUayix35pRHiWTrFe6u3M4Xew+mGLYuPNFZBToLkRkvEGUeJqYdAxXrG8q/Ky4EZ34=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd43371-0c5b-4ffa-d82f-08ddad0cb66a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:33:46.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1EkQq49moKL32DlzPNU0PR2RtLFQxrU6Gr/dPNOZa37RH7MFeOtHHM6TJR0UcknQ4AVKSalHT126dBat/RqiA9rDnV+yAkcRWcBcup2USY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfX2T5yh8mnsqGL
 gb4Z/YHOlEZBf7NHpcdEbMwNVG5BnsMBPcLGc9fbMX9k0KgHasuZkAc/gwNFaDBmrHXGRiT4lfl
 aA9gmpi4LUHXjKAaBAtGaCtf4sHLAZFXLD4dLPz2lM01TLCn5mph9pCC+hO43HQT0DXC2SWmAQs
 JyH+c5A/7/nWnZkIc4aLXpRZ39OH6tebZCP4sYC149QIw2kUWA4ou4ny1793ZdJpzQGFOkiqptA
 Fc0jt+xtSPjdmtTJVHxtblpsw5/fmei1NYnGnkkhIkistHstje/5Gio6NYM9AVb17tZP7h2P0Cq
 FWPrQ0XV3ESgjUAy0/dcxpGJJ3k35RyPnv15F60x86iXNZ2o1168b87Xjmqz1FOK9jdQKQqA3CM
 ceDIFY9CgdX3sV726542CswUyXsO6rIPDy10mk3P825KNQ3Cj6Dk0by0B+zilmoPld5pNTXz
X-Proofpoint-ORIG-GUID: uezeSXpCKSe8sG97NIwBut55Ekd6B5oF
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=685071a1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4gqqgb9KkQYgpC1g298A:9 a=zgiPjhLxNE0A:10
 cc=ntf awl=host:13206
X-Proofpoint-GUID: uezeSXpCKSe8sG97NIwBut55Ekd6B5oF
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare()
 file callback"),
 the f_op->mmap() hook has been deprecated in favour of f_op->mmap_prepare().
 Therefore, update the check for file operations supporting mmap() by using
 the file_has_valid_mmap_hooks() helper function, which checks for either
 f_op->mmap or f_op->mmap_prepare rather than checkin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRFbU-0008IX-9p
Subject: [f2fs-dev] [PATCH 02/10] mm/nommu: use file_has_valid_mmap_hooks()
 helper
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
 linux-fsdevel@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, ecryptfs@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
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

Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
callback"), the f_op->mmap() hook has been deprecated in favour of
f_op->mmap_prepare().

Therefore, update the check for file operations supporting mmap() by using
the file_has_valid_mmap_hooks() helper function, which checks for either
f_op->mmap or f_op->mmap_prepare rather than checking only for f_op->mmap
directly.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/nommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index b624acec6d2e..38c22ea0a95c 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -719,7 +719,7 @@ static int validate_mmap_request(struct file *file,
 
 	if (file) {
 		/* files must support mmap */
-		if (!file->f_op->mmap)
+		if (!file_has_valid_mmap_hooks(file))
 			return -ENODEV;
 
 		/* work out if what we've got could possibly be shared
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
