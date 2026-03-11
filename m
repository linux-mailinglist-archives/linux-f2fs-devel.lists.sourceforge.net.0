Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGBLIcDfsGkuoAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 04:21:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A257C25B600
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 04:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HQIyCVcSICRam/1tg69PP69OaeW8pN1QmR7UWL2Im8=; b=YCOgHcaBkB7rn7b1XZFmYHZ3oI
	uVKyXvXTr63UT4tKrbVs1JQY1bvSq4sALRQSusbKb3OgM+4QK612YqFT4dZJGDLJJ7dBFzXLEpIRc
	FHRpHPF5aUZRHDOUxNg91k880cLgMBcyPfiysvSbtIHjlMTH0O3DjAlSZl8kEgLthpro=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0A8S-00052Y-RJ;
	Wed, 11 Mar 2026 03:21:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w0A8R-00052R-Ch
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 03:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fWRUCZOIVgAqaUol9IcfAsuy0h2siOQCSNSW1Km6zZg=; b=fqDUosx7ZdroqAPSI/V17OwX0e
 It5KKhmjxi3Hlfha8vO6lziThgb7kyMCs8O2sAYbiP+msq7HQtKnc3IPkMUH0BXMfcdh4MX35DIjU
 xVi/RlcW6fS619ECTWfS07ZLkwNDv7/sFFGfb719UkSRtGk54CkqtzLRqxAIKr6juEGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fWRUCZOIVgAqaUol9IcfAsuy0h2siOQCSNSW1Km6zZg=; b=jjmPNHMeT1hXfphpZmfpO9/ks1
 O4LuDt0Oep0VPxcQ3ekKtuYUwOprJ/7rqGBPvjwUGEXlEF2uI6gYIFpdNFxR/rSI/DIVAG4LwS556
 z12bYGgUkcAUbz3g2ATXdKEH1kwyFEJATk5nBBIjciH65y+9DTFMrnOh0Y22Cm/Y98rQ=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0A8Q-0000ik-Si for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 03:21:23 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62B167iN3630177; Wed, 11 Mar 2026 03:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=fWRUCZOIVgAqaUol9I
 cfAsuy0h2siOQCSNSW1Km6zZg=; b=Hv0gKaGq/jdzw8X1B/+okDZOaode2xkMY4
 /p8Si09Xi/Pi2VGxdT6edW7IMRNAEqhN2YR9kCd2EX5cATPwrLOsk7xXXUw4QNGF
 kp3vBpxNZOeWsoMXdxYzLgq1ii7KyJOEGX7CbuY9kCebeyVeqxgD2ORvgT4XObu7
 Li7StM+R3ymsKZBwbfEiL1C9ZYtEoT2wvWZCCsycg/3298NmxSLdPns4zDmAX0HV
 ybxhuh1bRh5mtJCQA0/6YtztKDwFWRTkJMYNeV+K1ihBELRoKr9HL5PRINv7naY1
 08pxWGotsf6h4T+wyO5Byidn0fv8Kd2fJvZzqePRhdoUWGNnNBug==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cskua47uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2026 03:20:57 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62B1XYOj012950; Wed, 11 Mar 2026 03:20:56 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013048.outbound.protection.outlook.com
 [40.93.196.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4craffgdpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2026 03:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n59owF9IU6IAHB6khbPRU6z5ea8rMZuP/2Rq35Xz7m9F8IbGPmdbwf2C6NFyXGFqz1Xp4sqIt34zRepoW9amzxlIYUJFDHCOeH3Q5H+eV3PfBUZLjKK0N5k0aVryjBVbTDzQ/8HDbrm791Fv+J4nwrRSUywccRo4e7Ue06NGLzhQN98eW/WEll2u18jglBfDqv4HXuXhTRnXpGI7HVP2vYfAjxD0Djv7NkfQycHbEgXdSFKIlKFZZTUPSRwlJNGXAejODuvYMCIH8nXyf2cRtUkiP/3pWsHlUxJ5nBeZ2x6A7Jo/u24eEfF/F9uGlR2ViC339Ys/fIJ28NmjRalIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWRUCZOIVgAqaUol9IcfAsuy0h2siOQCSNSW1Km6zZg=;
 b=ctEcPi8KtHE8vYrqmMlB2ZvwIg0eqT60GkNtxWT9U/S++3FkZCe8nIoKmxhyQEE1UukoZONWZTZggefg/DQQstnJnRT2CBnQvll1YKuDVf+ka51sQqcMhId+PVe7KNIA+5e8XjH50kUoTqK6X1F1Ny7K7EAWN2j+UaLK+uum5LZMcqxyJaphsi5vHsJOEKTcSscn3FAT/jCibMR1y9B8GvwCZKESt82IPzZNNEzfw0dC5K4smciHCIS/C8KKNorbkXPih3vSQ/52VQPoFDFp9T64S4BfWko0tbMkAMGf9Mzhfh7sdoeckoilJBPnT4xsG7AyWWKbQLKqtqYLZ249Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWRUCZOIVgAqaUol9IcfAsuy0h2siOQCSNSW1Km6zZg=;
 b=F/6mbnaPASc3LZ+aPgPY0VUe/i8lb4dNtWnk/KHjwyq8SnjUmZrVVsYvsvVHmsEt7LdqypFJpNSQWlwinJENkNDLyoYz3KGSMRBrxD6SoIwokuQOt4hsmoC2cZNaIO7rmg1qtO4xxYbEByrENo9oE+jZZd4M2pXOcCyabkqw06Q=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH0PR10MB7535.namprd10.prod.outlook.com (2603:10b6:610:187::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 03:20:52 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 03:20:52 +0000
Date: Wed, 11 Mar 2026 12:20:42 +0900
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <abDfiqS7A8S6TsPd@hyeyoo>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
 <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org>
 <aaeLT8mnMMj_kPJc@hyeyoo>
 <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
 <aassZV5PjgFx8dSI@arm.com> <aa66XJDX4QfmEbNA@hyeyoo>
 <aa8uByvL9GwsGfnO@arm.com> <abDbxMmK0XEYgM1b@hyeyoo>
Content-Disposition: inline
In-Reply-To: <abDbxMmK0XEYgM1b@hyeyoo>
X-ClientProxiedBy: SE2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::13) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH0PR10MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: ab10ed20-80d0-49f8-c10d-08de7f1d32e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: kpQDv/+IJIO6ZTu3XrUt4Z5d7fNb4xVFalaEDENiLiWiXsDdOMjm5DQnK/9svOg25ZZSamwrIWmcWlU6If8Eukm/vRb2XoOjwP4rpHA4JRUQ0XNUz1jWn5tbDoRwQ8/Q6x6a5tEkHrtgDr+1vZjQLZyJcObSXwV/0VpSbFEMxTeDRjv/avbRfTOAYpeGPZgsM4riioliJ+KSrpJ5eof4PASYVcubuUCHrOvq273bYoZSJi6loITTtqTqnhBr21aKYf+xKcHsTEC8kJl6Bkepbpcv70V1uXjtlg9Q4dvqWN/j8t0ltWq5c25rb3wlmlQxm9Ed6NcDsvzzcS5IL9o5vyRunfSo60PkIlddwi1IjzSm0MLUh30MXfEr3gtZRkXMa33JQTqd1xK8GEjcnjWOMjMuriXjpHZ4gyfR0zRTx/F1eQ/f0NmR2BDHLqSmZb+J3EftlwjSZIupPtV+64JIsjldvCOqD+2HDEYQVtkIfSGjVUl67BOiZj6jCJXuTTtQIlO+VRwiW4OdiZ6DHRm4gpcPH91V34XhmvH2OYmupRuRRypbSLEee3R1yeoeET0/0dMCK2e1W2SoOfCQVDHB8j6bVL05SZIeGizinqApZTJrI9v4Ta5zfsKVD2hv4rKfgwQoOyV686sGzPnVnveoKch3Ml+oPHlLtpBhe0BcaUvlt0fLvC4gAa307tbAWrs+yW/Tiu07an8djrucHSSW/UPF5oLVgJqbaTmax0tPjOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WFFJot6shS+24dju5rkbkTZSL6C90fyGWCKN8lGd7Imgl+Yz4t5umcyc1iNW?=
 =?us-ascii?Q?i/r0gGKOmUEvW4EiANkvTyhesLKr0Z4o+4gtdqm2nu6HudHzYTx1bJcvyNEO?=
 =?us-ascii?Q?gibp1CC7b00gAuy129DUJNueai882ORlYGuEyKtxhP5ntZHJV2vQ9NcU7my5?=
 =?us-ascii?Q?dsDXXAodPnKt7JK8UKtfphZuUJ1oJQExDfV6RfCqiamr0VbtKrHy6NFM+vtC?=
 =?us-ascii?Q?bB6rUGobQcBAtoDmXMTYqcs/2CaKa4yGBxx37p8u83fdU6iAkZ0DKx3mIoAC?=
 =?us-ascii?Q?rV0p3YjsKzUvZEleVYc7VrLiyTIod2nEdTdmSsaoD+ihdzDrQM38S9KLRh5p?=
 =?us-ascii?Q?H4r7hTKmxvkZCNIjmLHFE1YTlB4k3wmF00k1fDYaRDpPL5fsURlkCYJn09Hm?=
 =?us-ascii?Q?g31eVvoM8tv/z37caU2A+aeMcEb25NNbivPjNz4lNWvF9C+PXtb5LYazqL4y?=
 =?us-ascii?Q?tHz/hoZtKnbnZ5/rQffoCo48crGbvTN+TkkBdekv96P5oycybWQHXzbpsU8J?=
 =?us-ascii?Q?JBGgj85bRTWKMBaqIFGf/2V/4wCMF/0y566ZMJlCLO5up7Gt2DKvaP6GjJ5H?=
 =?us-ascii?Q?Lqjhu8b24OPcpH5A6iEUJDMina5YrDjQ7lji3efg4nwKyTkrWjTSM8YfmsAf?=
 =?us-ascii?Q?A3NFikLkNYsAO1PSuDXlFvyxfT5T4RPecBUHYpQeQM7oNFVAZtbEBfrIgyPs?=
 =?us-ascii?Q?K1nuhNql8BLiVpr3F1ciuKuDJuwKod8jB4XWIC8g+ZPrRJnR6EOEHBkYaRxe?=
 =?us-ascii?Q?kjLAC1eVFen7sl/ETGf+s32PTDsR+KO871fv/Ua0EhpGske4XS1iUxkH3y3e?=
 =?us-ascii?Q?Mq46p7LWSYb1yaiNfK8OGBa/T9N5jOO/HOh2Ha5vmOMQb3036mlnvDq88u9T?=
 =?us-ascii?Q?qU1cPn43XAmEaAf/E9Byml1PjaXPMheamUlDVi8EY7MxEUzu4n8xnpfLq8gD?=
 =?us-ascii?Q?sjtRgVpTK4vEM/Z0bOD13zcKvQxSL0TvQrRKWNhmCqnAmVOevFWPPfB5e1Ki?=
 =?us-ascii?Q?xUMjWn3+nLlt4n4q1K2rt6At/CvdMp0m2A5g74DgW0+cHUeXiZyCOJRXM+f5?=
 =?us-ascii?Q?KKs6UgAcmZhlyalgpqqWipMoUYjdyvf6C9UfzX9YQAJsXXR30qtKv+BqMrIc?=
 =?us-ascii?Q?0I/j5B6nVMapz6VB86FuF7HEvi8Eh4mxpYqOwG6TRPxD/Cffcj0/5FlS71HK?=
 =?us-ascii?Q?FftXs/pD9x40U3v0sP8I0dT+ySZKxbQ4acDxzgEYeCBg4ndxDIZFPl4CJuRO?=
 =?us-ascii?Q?W3GBunvL58qz+KZLtauzSvT35S1EYZNGrrofw20hK4Ga3B3mUjgp13hUGKkU?=
 =?us-ascii?Q?hWmDzKeJ8wNWkKsQ+oh/9b8Wx/EsFJ3b5DQOqSJ17XwEqFfxx6iI0g5c9L41?=
 =?us-ascii?Q?M5Xo2WC7KJchE0Jj9vHe/n3K0EEsszTs3vXC8gtVifGmO9J62FJrj3fdo2D7?=
 =?us-ascii?Q?EfqF6vcs1QWT/g2VVbavrYjZv/YaWrCCUxDGnRQmm3NrtOGuII9f700CLAsO?=
 =?us-ascii?Q?a3DjVJ3+2T8UbLI5v3UrfHcRaoCoY3yWnXgfmuEouUfV/oK174Wy9qYoEPsp?=
 =?us-ascii?Q?U4zlQCCwVMcq/7NjOR14UtPk01f4ZFjYk3d1j/UBrKgs6bobxgONw4rKntHr?=
 =?us-ascii?Q?bRteSerMZvYf5UUG+uGbhRVeaSDDMz2uWP7ZOVyi5vcJD4SpWWsVTOU/BtF+?=
 =?us-ascii?Q?obdhvI4jwaeJ3GPG+TQkCSY/8DFZutVHM7L91YW2r41F4Ty6aSjDT2O4/CfH?=
 =?us-ascii?Q?zsVYlq/PYg=3D=3D?=
X-Exchange-RoutingPolicyChecked: GltdoRKKsNS6Bsv2PYhAPodpVxMFoYfNeexOXb3L/iJvOwEdMz0u/Oj8drVpJlKaqYGULqwoo3iypM/bQlCwLESjlJWGcz8dFnYY0TpJt33gAQbqJUk72GkLyQDl78E44wnTLApCpVwaQ8BQCTOoXrQUtA2ZWDtzvs/EOF3SzGQAsnFQ0QxbWqjV4o6T/3UdZPWE+tCA3Xn9mEyizLvyn3MWuKlKQddzZ/QMXL9RHiM+GSaz+Ja6u5VXRltPlEXKHw/rL1esUD6Ct2rlHMiuDQb57I3JF014OVtqS37eTFz2tmvV5SaL4/j5o790juiggvVhTzcWjHeqU7TGSxDpUA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Rr2BeikWG9sw5EX/LtgSqm4nP6TtdQmeTjkiWsw+QatLgFkH0vWCPXwd0ypHNsb3rVmCnByXVRZCh+B/kHH11CYgcq6LAGsLO3qXmr/EJHYdUNG9X4JEtme+w4RYXW5syytjJTxcIL4LG7ENld9Fr5nJ2YJGwyriviqm6wIo6kOf7saGn3CX5qBnI9z+BBg2oKxhn36j6btHym74ahmcwfGitN0LXVHvj3D03STh0W0jLieVaMgAIF5N0cIN/DXWNLCIAlowojPbEEowqtN9U8m5zC0eZkUnvPLrEeAzDrmWmlmVfRWjZp652eiy+1RMpreUzgUDRgwDCalVZTn+y7/j2KVgChYcOR+UxlfQWa7+3CrvFgHeiZ2JuxN7BZ4dpbdqI8LL6K+vRayx0zfkt+jlzLijvy9Ih2Pyv5KF/XsXyYJrHBYs3fbf7g13ky7miyTNmxWFmSDV0run9DozYU0rik+4e7U5TvtvCOahKAuNxvCanSGsHmgfI+j/f5gLkS+syTaoD10DvSETtaMKtVx2+Mnyac6AjcdTS1Vtd1rAuvCyfTzELuvVpjg37BB9uzoLNdQ4MurDU+667pdeqygZaAsF1U59uMaN7UFRBWA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab10ed20-80d0-49f8-c10d-08de7f1d32e2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 03:20:52.0922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auRsLeBIqoaXtaboSTZhnx1CawdT2w7J79vhIRBrxvjfbNZQ2UAh+mr511c6t/Wlpn+tEle2b0ckB1vnInNpzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7535
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603110026
X-Authority-Analysis: v=2.4 cv=Methep/f c=1 sm=1 tr=0 ts=69b0df99 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=_DZJeIRjfaHWHcdDIicA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13819
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNSBTYWx0ZWRfX/ZWGebC5wp4A
 T4l0x/A8MaBLYDoat6ZdQEtJb5y4fL2Lof8ytaH/abFwkd1BM03/5OpECgw+t1rx5XW5661gfPC
 ugPAv0s3yAFZxIMWyJw2yy8FkDIcy7GbytrZAV1bjmk093nC17r+UvOPvG6duZ0VBzSZ8YbzVVd
 CFZdMif47xA61miZuC53mP4A7Y8R9p50qFd7fffekGvI5+bLaAhMaWCodatOmRjpQExqw4H1Zmt
 sIOMup11M5aFcrbYIEljGOJtRLuuPBY+Nhhp+sy1c4T4N0GJOT/fig2AYI0NSO5vp/ejEL4mV5Q
 kJ1vLattuzypCnRW2oCOmMJPTn5+42G5jYlhexR+Peo2WbxJqqWDejCrCYRih0aCnaT/yT2OeE5
 0FrMG3iXqmbYpgV1DfBcvdo9rOkvYBmTsuC7clIoCVywDLD6p2nKkfX+c+ohDVbvnidH//zPi7q
 pPS1vTtvsxbjvO6ka3CU8g58hfUnNpuu9jFaV/nA=
X-Proofpoint-ORIG-GUID: aHPGTOuir9WRX5kRQHIvk_ZY9Ybdk5tI
X-Proofpoint-GUID: aHPGTOuir9WRX5kRQHIvk_ZY9Ybdk5tI
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 11, 2026 at 12:04:36PM +0900, Harry Yoo wrote:
 > > > > 8< > > > > diff --git a/mm/slub.c b/mm/slub.c > > > > index
 0c906fefc31b..401557ff5487 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0A8Q-0000ik-Si
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
Cc: Qing Wang <wangqing7171@gmail.com>,
 "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, lorenzo.stoakes@oracle.com,
 jannh@google.com, Hao Li <hao.li@linux.dev>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com, linux-mm@kvack.org,
 sj1557.seo@samsung.com, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A257C25B600
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:hao.li@linux.dev,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:sj1557.seo@samsung.com,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,linux.dev,googlegroups.com,vger.kernel.org,syzkaller.appspotmail.com,kvack.org,samsung.com,suse.de,linux-foundation.org,lists.sourceforge.net,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 12:04:36PM +0900, Harry Yoo wrote:
> > > > -----------8<-----------------------------------
> > > > diff --git a/mm/slub.c b/mm/slub.c
> > > > index 0c906fefc31b..401557ff5487 100644
> > > > --- a/mm/slub.c
> > > > +++ b/mm/slub.c
> > > > @@ -7513,6 +7513,7 @@ static void early_kmem_cache_node_alloc(int node)
> > > >  	slab->freelist = get_freepointer(kmem_cache_node, n);
> > > >  	slab->inuse = 1;
> > > >  	kmem_cache_node->node[node] = n;
> > > > +	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);
> 
> By the way, this should have been kmem_cache_node->object_size.
> Because... the length of kmem_cache_node.node array is not always
> MAX_NUMNODES (yeah, that's confusing).

Oops, please feel free to ignore this paragraph!
I was totally confused, it's not size of struct kmem_cache.

-- 
Cheers,
Harry / Hyeonggon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
